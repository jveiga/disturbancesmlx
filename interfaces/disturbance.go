package interfaces

import (
	"errors"
	"fmt"
	"time"

	sq "github.com/gbl08ma/squirrel"
	"github.com/heetch/sqalx"
	"github.com/lib/pq"
)

// Disturbance represents a disturbance
type Disturbance struct {
	ID          string
	StartTime   time.Time
	EndTime     time.Time
	Ended       bool
	Line        *Line
	Description string
	Statuses    []*Status
}

// GetDisturbances returns a slice with all registered disturbancees
func GetDisturbances(node sqalx.Node) ([]*Disturbance, error) {
	disturbances := []*Disturbance{}

	tx, err := node.Beginx()
	if err != nil {
		return disturbances, err
	}
	defer tx.Commit() // read-only tx

	rows, err := sdb.Select("id", "time_start", "time_end", "mline", "description").
		From("line_disturbance").
		OrderBy("time_start ASC").
		RunWith(tx).Query()
	if err != nil {
		return disturbances, fmt.Errorf("GetDisturbances: %s", err)
	}

	lineIDs := []string{}
	for rows.Next() {
		var disturbance Disturbance
		var timeEnd pq.NullTime
		var lineID string
		err := rows.Scan(
			&disturbance.ID,
			&disturbance.StartTime,
			&timeEnd,
			&lineID,
			&disturbance.Description)
		if err != nil {
			rows.Close()
			return disturbances, fmt.Errorf("GetDisturbances: %s", err)
		}
		disturbance.EndTime = timeEnd.Time
		disturbance.Ended = timeEnd.Valid

		disturbances = append(disturbances, &disturbance)
		lineIDs = append(lineIDs, lineID)
	}
	if err := rows.Err(); err != nil {
		rows.Close()
		return disturbances, fmt.Errorf("GetDisturbances: %s", err)
	}
	rows.Close()

	for i := range disturbances {
		disturbances[i].Line, err = GetLine(tx, lineIDs[i])
		if err != nil {
			return disturbances, fmt.Errorf("GetDisturbances: %s", err)
		}
		rows, err := sdb.Select("status_id").
			From("line_disturbance_has_status").
			Where(sq.Eq{"disturbance_id": disturbances[i].ID}).
			RunWith(tx).Query()
		if err != nil {
			return disturbances, fmt.Errorf("GetDisturbances: %s", err)
		}

		for rows.Next() {
			var statusID string
			err := rows.Scan(&statusID)
			if err != nil {
				rows.Close()
				return disturbances, fmt.Errorf("GetDisturbances: %s", err)
			}
			status, err := GetStatus(tx, statusID)
			if err != nil {
				rows.Close()
				return disturbances, fmt.Errorf("GetDisturbances: %s", err)
			}
			disturbances[i].Statuses = append(disturbances[i].Statuses, status)
		}
		if err := rows.Err(); err != nil {
			rows.Close()
			return disturbances, fmt.Errorf("GetDisturbances: %s", err)
		}
		rows.Close()
	}
	return disturbances, nil
}

// GetOngoingDisturbancesForLine returns a slice with all ongoing disturbances for a certain line
func GetOngoingDisturbancesForLine(node sqalx.Node, line *Line) ([]*Disturbance, error) {
	disturbances := []*Disturbance{}

	tx, err := node.Beginx()
	if err != nil {
		return disturbances, err
	}
	defer tx.Commit() // read-only tx

	rows, err := sdb.Select("id", "time_start", "time_end", "mline", "description").
		From("line_disturbance").
		Where(sq.Eq{"mline": line.ID}).
		Where("time_end IS NULL").
		OrderBy("time_start ASC").
		RunWith(tx).Query()
	if err != nil {
		return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
	}

	lineIDs := []string{}
	for rows.Next() {
		var disturbance Disturbance
		var timeEnd pq.NullTime
		var lineID string
		err := rows.Scan(
			&disturbance.ID,
			&disturbance.StartTime,
			&timeEnd,
			&lineID,
			&disturbance.Description)
		if err != nil {
			rows.Close()
			return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
		}
		disturbance.EndTime = timeEnd.Time
		disturbance.Ended = timeEnd.Valid

		disturbances = append(disturbances, &disturbance)
		lineIDs = append(lineIDs, lineID)
	}
	if err := rows.Err(); err != nil {
		rows.Close()
		return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
	}
	rows.Close()

	for i := range disturbances {
		disturbances[i].Line, err = GetLine(tx, lineIDs[i])
		if err != nil {
			return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
		}
		rows, err := sdb.Select("status_id").
			From("line_disturbance_has_status").
			Where(sq.Eq{"disturbance_id": disturbances[i].ID}).
			RunWith(tx).Query()
		if err != nil {
			return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
		}

		statusIDs := []string{}
		for rows.Next() {
			var statusID string
			err := rows.Scan(&statusID)
			if err != nil {
				rows.Close()
				return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
			}
			statusIDs = append(statusIDs, statusID)
		}
		if err := rows.Err(); err != nil {
			rows.Close()
			return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
		}
		rows.Close()

		for i := range statusIDs {
			status, err := GetStatus(tx, statusIDs[i])
			if err != nil {
				return disturbances, fmt.Errorf("GetOngoingDisturbancesForLine: %s", err)
			}
			disturbances[i].Statuses = append(disturbances[i].Statuses, status)
		}
	}
	return disturbances, nil
}

// GetDisturbance returns the Disturbance with the given ID
func GetDisturbance(node sqalx.Node, id string) (*Disturbance, error) {
	var disturbance Disturbance
	tx, err := node.Beginx()
	if err != nil {
		return &disturbance, err
	}
	defer tx.Commit() // read-only tx

	var lineID string
	var timeEnd pq.NullTime
	err = sdb.Select("id", "time_start", "time_end", "mline", "description").
		From("line_disturbance").
		Where(sq.Eq{"id": id}).
		RunWith(tx).QueryRow().Scan(
		&disturbance.ID,
		&disturbance.StartTime,
		&timeEnd,
		&lineID,
		&disturbance.Description)
	if err != nil {
		return &disturbance, errors.New("GetDisturbance: " + err.Error())
	}
	disturbance.EndTime = timeEnd.Time
	disturbance.Ended = timeEnd.Valid
	disturbance.Line, err = GetLine(tx, lineID)
	if err != nil {
		return &disturbance, fmt.Errorf("GetDisturbance: %s", err)
	}

	rows, err := sdb.Select("status_id").
		From("line_disturbance_has_status").
		Where(sq.Eq{"disturbance_id": disturbance.ID}).
		RunWith(tx).Query()
	if err != nil {
		return &disturbance, fmt.Errorf("GetDisturbance: %s", err)
	}
	defer rows.Close()

	for rows.Next() {
		var statusID string
		err := rows.Scan(&statusID)
		if err != nil {
			return &disturbance, fmt.Errorf("GetDisturbance: %s", err)
		}
		status, err := GetStatus(tx, statusID)
		if err != nil {
			return &disturbance, fmt.Errorf("GetDisturbance: %s", err)
		}
		disturbance.Statuses = append(disturbance.Statuses, status)
	}
	if err := rows.Err(); err != nil {
		return &disturbance, fmt.Errorf("GetDisturbance: %s", err)
	}

	return &disturbance, nil
}

// Update adds or updates the disturbance
func (disturbance *Disturbance) Update(node sqalx.Node) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	timeEnd := pq.NullTime{
		Time:  disturbance.EndTime,
		Valid: disturbance.Ended,
	}

	_, err = sdb.Insert("line_disturbance").
		Columns("id", "time_start", "time_end", "mline", "description").
		Values(disturbance.ID, disturbance.StartTime, timeEnd, disturbance.Line.ID, disturbance.Description).
		Suffix("ON CONFLICT (id) DO UPDATE SET time_start = ?, time_end = ?, mline = ?, description = ?",
			disturbance.StartTime, timeEnd, disturbance.Line.ID, disturbance.Description).
		RunWith(tx).Exec()
	if err != nil {
		return errors.New("AddDisturbance: " + err.Error())
	}

	_, err = sdb.Delete("line_disturbance_has_status").
		Where(sq.Eq{"disturbance_id": disturbance.ID}).RunWith(tx).Exec()
	if err != nil {
		return fmt.Errorf("AddDisturbance: %s", err)
	}

	for i := range disturbance.Statuses {
		err = disturbance.Statuses[i].Update(tx)
		if err != nil {
			return errors.New("AddDisturbance: " + err.Error())
		}

		_, err = sdb.Insert("line_disturbance_has_status").
			Columns("disturbance_id", "status_id").
			Values(disturbance.ID, disturbance.Statuses[i].ID).
			RunWith(tx).Exec()
	}
	return tx.Commit()
}

// Delete deletes the disturbance
func (disturbance *Disturbance) Delete(node sqalx.Node, disturbanceID string) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	_, err = sdb.Delete("line_disturbance_has_status").
		Where(sq.Eq{"disturbance_id": disturbance.ID}).RunWith(tx).Exec()
	if err != nil {
		return fmt.Errorf("RemoveDisturbance: %s", err)
	}

	_, err = sdb.Delete("line_disturbance").
		Where(sq.Eq{"id": disturbance.ID}).RunWith(tx).Exec()
	if err != nil {
		return fmt.Errorf("RemoveDisturbance: %s", err)
	}
	return tx.Commit()
}