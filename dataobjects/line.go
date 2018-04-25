package dataobjects

import (
	"errors"
	"fmt"
	"sort"
	"time"

	"github.com/SaidinWoT/timespan"
	sq "github.com/gbl08ma/squirrel"
	"github.com/heetch/sqalx"
	uuid "github.com/satori/go.uuid"
)

// StatusNotification contains the information needed to issue a disturbance
// notification
type StatusNotification struct {
	Disturbance *Disturbance
	Status      *Status
}

// NewStatusNotification is a channel where a StatusNotification will be sent
// whenever a new status/disturbance notification should be issued
var NewStatusNotification = make(chan StatusNotification)

// Line is a Network line
type Line struct {
	ID          string
	Name        string
	MainLocale  string
	Names       map[string]string
	Color       string
	TypicalCars int
	Order       int
	Network     *Network
}

// GetLines returns a slice with all registered lines
func GetLines(node sqalx.Node) ([]*Line, error) {
	return getLinesWithSelect(node, sdb.Select().OrderBy("\"order\" ASC"))
}

func getLinesWithSelect(node sqalx.Node, sbuilder sq.SelectBuilder) ([]*Line, error) {
	lines := []*Line{}
	lineMap := make(map[string]*Line)

	tx, err := node.Beginx()
	if err != nil {
		return lines, err
	}
	defer tx.Commit() // read-only tx

	rows, err := sbuilder.Columns("mline.id", "mline.name", "mline.color", "mline.network", "mline.typ_cars", "mline.order").
		From("mline").
		RunWith(tx).Query()
	if err != nil {
		return lines, fmt.Errorf("getLinesWithSelect: %s", err)
	}
	defer rows.Close()

	var networkIDs []string
	for rows.Next() {
		var line Line
		var networkID string
		err := rows.Scan(
			&line.ID,
			&line.Name,
			&line.Color,
			&networkID,
			&line.TypicalCars,
			&line.Order)
		if err != nil {
			return lines, fmt.Errorf("getLinesWithSelect: %s", err)
		}
		if err != nil {
			return lines, fmt.Errorf("getLinesWithSelect: %s", err)
		}
		lines = append(lines, &line)
		networkIDs = append(networkIDs, networkID)
		lineMap[line.ID] = &line
		lineMap[line.ID].Names = make(map[string]string)
	}
	if err := rows.Err(); err != nil {
		return lines, fmt.Errorf("getLinesWithSelect: %s", err)
	}
	for i := range networkIDs {
		lines[i].Network, err = GetNetwork(tx, networkIDs[i])
		if err != nil {
			return lines, fmt.Errorf("getLinesWithSelect: %s", err)
		}
	}

	// get MainLocale for each line
	rows2, err := sbuilder.Columns("mline.id", "line_name.lang").
		From("mline").
		Join("line_name ON mline.id = line_name.id AND line_name.main = true").
		RunWith(tx).Query()
	if err != nil {
		return lines, fmt.Errorf("getLinesWithSelect: %s", err)
	}
	defer rows2.Close()

	for rows2.Next() {
		var id string
		var lang string
		err := rows2.Scan(&id, &lang)
		if err != nil {
			return lines, fmt.Errorf("getLinesWithSelect: %s", err)
		}
		lineMap[id].MainLocale = lang
	}
	if err := rows2.Err(); err != nil {
		return lines, fmt.Errorf("getLinesWithSelect: %s", err)
	}

	// get localized name map for each line
	rows3, err := sbuilder.Columns("mline.id", "line_name.lang", "line_name.name").
		From("mline").
		Join("line_name ON mline.id = line_name.id").
		RunWith(tx).Query()
	if err != nil {
		return lines, fmt.Errorf("getLinesWithSelect: %s", err)
	}
	defer rows3.Close()

	for rows3.Next() {
		var id string
		var lang string
		var name string
		err := rows3.Scan(&id, &lang, &name)
		if err != nil {
			return lines, fmt.Errorf("getLinesWithSelect: %s", err)
		}
		lineMap[id].Names[lang] = name
	}
	if err := rows3.Err(); err != nil {
		return lines, fmt.Errorf("getLinesWithSelect: %s", err)
	}

	return lines, nil
}

// GetLine returns the Line with the given ID
func GetLine(node sqalx.Node, id string) (*Line, error) {
	s := sdb.Select().
		Where(sq.Eq{"mline.id": id})
	lines, err := getLinesWithSelect(node, s)
	if err != nil {
		return nil, err
	}
	if len(lines) == 0 {
		return nil, errors.New("Line not found")
	}
	return lines[0], nil
}

// Stations returns the stations that are served by this line
func (line *Line) Stations(node sqalx.Node) ([]*Station, error) {
	s := sdb.Select().
		Join("line_has_station ON line_id = ? AND station_id = id", line.ID).
		OrderBy("position")
	return getStationsWithSelect(node, s)
}

// GetDirectionForConnection returns the station that is the terminus for this
// line in the direction of the provided connection. If the connection is not
// part of this line, an error is returned
func (line *Line) GetDirectionForConnection(node sqalx.Node, connection *Connection) (*Station, error) {
	tx, err := node.Beginx()
	if err != nil {
		return nil, err
	}
	defer tx.Commit() // read-only tx

	stations, err := line.Stations(tx)
	if err != nil {
		return nil, err
	}
	numStations := len(stations)
	for index, station := range stations {
		if index+1 <= numStations-1 && station.ID == connection.From.ID && stations[index+1].ID == connection.To.ID {
			// connection is in the "positive" direction
			return stations[numStations-1], nil
		}
		// deal with a single closed station...
		if index+2 <= numStations-1 && station.ID == connection.From.ID && stations[index+2].ID == connection.To.ID {
			if closed, err := stations[index+1].Closed(tx); err == nil && closed {
				// connection is in the "positive" direction
				return stations[numStations-1], nil
			}
		}

		if index-1 >= 0 && station.ID == connection.From.ID && stations[index-1].ID == connection.To.ID {
			// connection is in the "negative" direction
			return stations[0], nil
		}
		// deal with a single closed station...
		if index-2 >= 0 && station.ID == connection.From.ID && stations[index-2].ID == connection.To.ID {
			if closed, err := stations[index-1].Closed(tx); err == nil && closed {
				// connection is in the "negative" direction
				return stations[0], nil
			}
		}
	}
	return nil, errors.New("GetDirectionForConnection: specified connection is not part of this line")
}

// OngoingDisturbances returns a slice with all ongoing disturbances on this line
func (line *Line) OngoingDisturbances(node sqalx.Node) ([]*Disturbance, error) {
	s := sdb.Select().
		Where(sq.Eq{"mline": line.ID}).
		Where("time_end IS NULL").
		OrderBy("time_start ASC")
	return getDisturbancesWithSelect(node, s)
}

// DisturbancesBetween returns a slice with all disturbances that start or end between the specified times
func (line *Line) DisturbancesBetween(node sqalx.Node, startTime time.Time, endTime time.Time) ([]*Disturbance, error) {
	s := sdb.Select().
		Where(sq.Eq{"mline": line.ID}).
		Where(sq.Or{
			sq.Expr("time_start BETWEEN ? AND ?", startTime, endTime),
			sq.And{
				sq.Expr("time_end IS NOT NULL"),
				sq.Expr("time_end BETWEEN ? AND ?", startTime, endTime),
			},
		}).OrderBy("time_start ASC")
	return getDisturbancesWithSelect(node, s)
}

// CountDisturbancesByDay counts disturbances by day between the specified dates
func (line *Line) CountDisturbancesByDay(node sqalx.Node, start time.Time, end time.Time) ([]int, error) {
	tx, err := node.Beginx()
	if err != nil {
		return []int{}, err
	}
	defer tx.Commit() // read-only tx

	rows, err := tx.Query("SELECT curd, COUNT(id) "+
		"FROM generate_series(($2 at time zone $1)::date, ($3 at time zone $1)::date, '1 day') AS curd "+
		"LEFT OUTER JOIN line_disturbance ON "+
		"(curd BETWEEN (time_start at time zone $1)::date AND (coalesce(time_end, now()) at time zone $1)::date) "+
		"AND mline = $4 "+
		"GROUP BY curd ORDER BY curd;",
		start.Location().String(), start, end, line.ID)
	if err != nil {
		return []int{}, fmt.Errorf("CountDisturbancesByDay: %s", err)
	}
	defer rows.Close()

	var counts []int
	for rows.Next() {
		var date time.Time
		var count int
		err := rows.Scan(&date, &count)
		if err != nil {
			return counts, fmt.Errorf("CountDisturbancesByDay: %s", err)
		}
		if err != nil {
			return counts, fmt.Errorf("CountDisturbancesByDay: %s", err)
		}
		counts = append(counts, count)
	}
	if err := rows.Err(); err != nil {
		return counts, fmt.Errorf("CountDisturbancesByDay: %s", err)
	}
	return counts, nil
}

// CountDisturbancesByHourOfDay counts disturbances by hour of day between the specified dates
func (line *Line) CountDisturbancesByHourOfDay(node sqalx.Node, start time.Time, end time.Time) ([]int, error) {
	tx, err := node.Beginx()
	if err != nil {
		return []int{}, err
	}
	defer tx.Commit() // read-only tx

	rows, err := tx.Query("SELECT date_part('hour', curd) AS hour, COUNT(id) "+
		"FROM generate_series(($2 at time zone $1)::date, ($3 at time zone $1)::date + interval '1 day' - interval '1 second', '1 hour') AS curd "+
		"LEFT OUTER JOIN line_disturbance ON "+
		"(curd BETWEEN date_trunc('hour', time_start at time zone $1) AND date_trunc('hour', coalesce(time_end, now()) at time zone $1)) "+
		"AND mline = $4 "+
		"GROUP BY hour ORDER BY hour;",
		start.Location().String(), start, end, line.ID)
	if err != nil {
		return []int{}, fmt.Errorf("CountDisturbancesByDay: %s", err)
	}
	defer rows.Close()

	var counts []int
	for rows.Next() {
		var hour int
		var count int
		err := rows.Scan(&hour, &count)
		if err != nil {
			return counts, fmt.Errorf("CountDisturbancesByDay: %s", err)
		}
		if err != nil {
			return counts, fmt.Errorf("CountDisturbancesByDay: %s", err)
		}
		counts = append(counts, count)
	}
	if err := rows.Err(); err != nil {
		return counts, fmt.Errorf("CountDisturbancesByDay: %s", err)
	}
	return counts, nil
}

// LastOngoingDisturbance returns the latest ongoing disturbance affecting this line
func (line *Line) LastOngoingDisturbance(node sqalx.Node) (*Disturbance, error) {
	tx, err := node.Beginx()
	if err != nil {
		return nil, err
	}
	defer tx.Commit() // read-only tx

	// are there any ongoing disturbances? get the one with most recent START time
	s := sdb.Select().
		Where(sq.Eq{"mline": line.ID}).
		Where(sq.Expr("time_start = (SELECT MAX(time_start) FROM line_disturbance WHERE mline = ? AND time_end IS NULL)", line.ID)).
		OrderBy("time_start DESC")
	disturbances, err := getDisturbancesWithSelect(tx, s)
	if err != nil {
		return nil, err
	}
	if len(disturbances) == 0 {
		return nil, errors.New("No ongoing disturbances for this line")
	}
	return disturbances[0], nil
}

// LastDisturbance returns the latest disturbance affecting this line
func (line *Line) LastDisturbance(node sqalx.Node) (*Disturbance, error) {
	tx, err := node.Beginx()
	if err != nil {
		return nil, err
	}
	defer tx.Commit() // read-only tx

	// are there any ongoing disturbances? get the one with most recent START time
	disturbance, err := line.LastOngoingDisturbance(tx)
	if err != nil {
		// no ongoing disturbances. look at past ones and get the one with the most recent END time
		s := sdb.Select().
			Where(sq.Eq{"mline": line.ID}).
			Where(sq.Expr("time_end = (SELECT MAX(time_end) FROM line_disturbance WHERE mline = ?)", line.ID)).
			OrderBy("time_end DESC")
		disturbances, err := getDisturbancesWithSelect(tx, s)
		if err != nil {
			return nil, errors.New("LastDisturbance: " + err.Error())
		}
		if len(disturbances) == 0 {
			return nil, errors.New("No disturbances for this line")
		}
		return disturbances[0], err
	}
	return disturbance, err
}

// Availability returns the fraction of time this line operated without issues
// between the specified times, and the average duration for each disturbance
func (line *Line) Availability(node sqalx.Node, startTime time.Time, endTime time.Time) (availability float64, avgDuration time.Duration, err error) {
	tx, err := node.Beginx()
	if err != nil {
		return 100.0, 0, err
	}
	defer tx.Commit() // read-only tx

	disturbances, err := line.DisturbancesBetween(tx, startTime, endTime)
	if err != nil {
		return 100.0, 0, err
	}

	var downTime time.Duration
	for _, d := range disturbances {
		if d.Ended {
			downTime += d.EndTime.Sub(d.StartTime)
		} else {
			downTime += endTime.Sub(d.StartTime)
		}
	}

	if len(disturbances) > 0 {
		avgDuration = downTime / time.Duration(len(disturbances))
	}

	closedDuration, err := line.getClosedDuration(tx, startTime, endTime)
	if err != nil {
		return 100.0, 0, err
	}

	totalTime := endTime.Sub(startTime) - closedDuration
	return 1.0 - (downTime.Minutes() / totalTime.Minutes()), avgDuration, nil
}

func (line *Line) getClosedDuration(tx sqalx.Node, startTime time.Time, endTime time.Time) (time.Duration, error) {
	schedules, err := line.Schedules(tx)
	if err != nil {
		return 0, err
	}

	var openDuration time.Duration
	wholeSpan := timespan.New(startTime, endTime.Sub(startTime))
	// expand one day on both sides so we can be sure the schedule info captures everything
	ct := startTime.AddDate(0, 0, -1)
	et := endTime.AddDate(0, 0, 1)
	for ct.Before(et) {
		schedule := line.getScheduleForDay(ct, schedules)
		openTime := time.Time(schedule.OpenTime)
		openTime = time.Date(ct.Year(), ct.Month(), ct.Day(), openTime.Hour(), openTime.Minute(), openTime.Second(), openTime.Nanosecond(), ct.Location())
		closeTime := openTime.Add(time.Duration(schedule.OpenDuration))

		openSpan := timespan.New(openTime, closeTime.Sub(openTime))
		d, hasIntersection := wholeSpan.Intersection(openSpan)
		if hasIntersection {
			openDuration += d.Duration()
		}
		ct = ct.AddDate(0, 0, 1)
	}

	return wholeSpan.Duration() - openDuration, nil
}

func (line *Line) getScheduleForDay(day time.Time, schedules []*LineSchedule) *LineSchedule {
	holidays := make([]int, len(line.Network.Holidays))
	for i, holiday := range line.Network.Holidays {
		holidays[i] = int(holiday)
	}

	// look for specific day overrides (holiday == true, day != 0)
	for _, schedule := range schedules {
		if schedule.Holiday && schedule.Day == day.YearDay() {
			return schedule
		}
	}

	// check if this is a holiday
	holidayIdx := sort.SearchInts(holidays, day.YearDay())
	if holidayIdx < len(holidays) && holidays[holidayIdx] == day.YearDay() {
		// holiday, return the schedule for holidays
		for _, schedule := range schedules {
			if schedule.Holiday && schedule.Day == 0 {
				return schedule
			}
		}
	}

	for _, schedule := range schedules {
		if !schedule.Holiday && schedule.Day == int(day.Weekday()) {
			return schedule
		}
	}
	return nil
}

// DisturbanceDuration returns the total duration of the disturbances in this line between the specified times
func (line *Line) DisturbanceDuration(node sqalx.Node, startTime time.Time, endTime time.Time) (avgDuration time.Duration, err error) {
	tx, err := node.Beginx()
	if err != nil {
		return 0, err
	}
	defer tx.Commit() // read-only tx

	disturbances, err := line.DisturbancesBetween(tx, startTime, endTime)
	if err != nil {
		return 0, err
	}

	var downTime time.Duration
	for _, d := range disturbances {
		thisEnd := d.EndTime
		if !d.Ended {
			thisEnd = time.Now()
		}
		if thisEnd.After(endTime) {
			thisEnd = endTime
		}
		thisStart := d.StartTime
		if thisStart.Before(startTime) {
			thisStart = startTime
		}
		downTime += thisEnd.Sub(thisStart)
	}
	return downTime, nil
}

// Schedules returns the schedules of this line
func (line *Line) Schedules(node sqalx.Node) ([]*LineSchedule, error) {
	s := sdb.Select().
		Where(sq.Eq{"line_id": line.ID})
	return getLineSchedulesWithSelect(node, s)
}

// Paths returns the paths of this line
func (line *Line) Paths(node sqalx.Node) ([]*LinePath, error) {
	s := sdb.Select().
		Where(sq.Eq{"line_id": line.ID})
	return getLinePathsWithSelect(node, s)
}

// Statuses returns all the statuses for this line
func (line *Line) Statuses(node sqalx.Node) ([]*Status, error) {
	s := sdb.Select().
		Where(sq.Eq{"mline": line.ID})
	return getStatusesWithSelect(node, s)
}

// AddStatus associates a new status with this line, and runs the disturbance
// start/end logic
func (line *Line) AddStatus(node sqalx.Node, status *Status) error {
	if status.Line.ID != line.ID {
		return errors.New("The line of the status does not match the receiver line")
	}
	status.Line = line // so we don't have two different pointers to what should be the same thing

	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	err = status.Update(tx)
	if err != nil {
		return err
	}

	ongoing, err := line.OngoingDisturbances(tx)
	if err != nil {
		return err
	}
	if len(ongoing) > 0 {
		// there's an ongoing disturbance
		disturbance := ongoing[len(ongoing)-1]

		previousStatus := disturbance.LatestStatus()
		if previousStatus != nil &&
			status.Status == previousStatus.Status &&
			status.IsDowntime == previousStatus.IsDowntime {
			// do not add repeated status to disturbance (nor issue a new notif)
			// our work here is done
			return tx.Commit()
		}

		if !status.IsDowntime {
			// "close" this disturbance
			disturbance.EndTime = status.Time
			disturbance.Ended = true
		}
		disturbance.Statuses = append(disturbance.Statuses, status)
		err = disturbance.Update(tx)
		if err != nil {
			return err
		}

		// blocking send
		NewStatusNotification <- StatusNotification{
			Disturbance: disturbance,
			Status:      status,
		}
	} else if status.IsDowntime {
		// no ongoing disturbances, create new one
		id, err := uuid.NewV4()
		if err != nil {
			return err
		}
		disturbance := &Disturbance{
			ID:          id.String(),
			Line:        line,
			StartTime:   status.Time,
			Description: status.Status,
			Statuses:    []*Status{status},
		}
		err = disturbance.Update(tx)
		if err != nil {
			return err
		}
		// blocking send
		NewStatusNotification <- StatusNotification{
			Disturbance: disturbance,
			Status:      status,
		}
	}
	return tx.Commit()
}

// Update adds or updates the line
func (line *Line) Update(node sqalx.Node) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	err = line.Network.Update(tx)
	if err != nil {
		return errors.New("AddLine: " + err.Error())
	}

	_, err = sdb.Insert("mline").
		Columns("id", "name", "color", "network", "typ_cars", "\"order\"").
		Values(line.ID, line.Name, line.Color, line.Network.ID, line.TypicalCars, line.Order).
		Suffix("ON CONFLICT (id) DO UPDATE SET name = ?, color = ?, network = ?, typ_cars = ?, \"order\" = ?",
			line.Name, line.Color, line.Network.ID, line.TypicalCars, line.Order).
		RunWith(tx).Exec()

	if err != nil {
		return errors.New("AddLine: " + err.Error())
	}
	return tx.Commit()
}

// Delete deletes the line
func (line *Line) Delete(node sqalx.Node) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	_, err = sdb.Delete("mline").
		Where(sq.Eq{"id": line.ID}).RunWith(tx).Exec()
	if err != nil {
		return fmt.Errorf("RemoveLine: %s", err)
	}
	return tx.Commit()
}
