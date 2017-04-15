package interfaces

import (
	"errors"
	"fmt"

	sq "github.com/gbl08ma/squirrel"
	"github.com/heetch/sqalx"
)

// Connection connects two stations in a single direction
type Connection struct {
	From           *Station
	To             *Station
	TypicalSeconds int
}

// GetConnections returns a slice with all registered connections
func GetConnections(node sqalx.Node) ([]*Connection, error) {
	return getConnectionsWithSelect(node, sdb.Select())
}

func getConnectionsWithSelect(node sqalx.Node, sbuilder sq.SelectBuilder) ([]*Connection, error) {
	connections := []*Connection{}

	tx, err := node.Beginx()
	if err != nil {
		return connections, err
	}
	defer tx.Commit() // read-only tx

	rows, err := sbuilder.Columns("from_station", "to_station", "typ_time").
		From("connection").
		RunWith(tx).Query()
	if err != nil {
		return connections, fmt.Errorf("getConnectionsWithSelect: %s", err)
	}
	defer rows.Close()

	var fromIDs []string
	var toIDs []string
	for rows.Next() {
		var connection Connection
		var fromID string
		var toID string
		err := rows.Scan(
			&fromID,
			&toID,
			&connection.TypicalSeconds)
		if err != nil {
			return connections, fmt.Errorf("getConnectionsWithSelect: %s", err)
		}
		if err != nil {
			return connections, fmt.Errorf("getConnectionsWithSelect: %s", err)
		}
		connections = append(connections, &connection)
		fromIDs = append(fromIDs, fromID)
		toIDs = append(toIDs, toID)
	}
	if err := rows.Err(); err != nil {
		return connections, fmt.Errorf("getConnectionsWithSelect: %s", err)
	}
	for i := range connections {
		connections[i].From, err = GetStation(tx, fromIDs[i])
		if err != nil {
			return connections, fmt.Errorf("getConnectionsWithSelect: %s", err)
		}
		connections[i].To, err = GetStation(tx, toIDs[i])
		if err != nil {
			return connections, fmt.Errorf("getConnectionsWithSelect: %s", err)
		}
	}
	return connections, nil
}

// GetConnection returns the Connection with the given ID
func GetConnection(node sqalx.Node, from string, to string) (*Connection, error) {
	var connection Connection
	tx, err := node.Beginx()
	if err != nil {
		return &connection, err
	}
	defer tx.Commit() // read-only tx

	var fromID string
	var toID string
	err = sdb.Select("from_station", "to_station", "typ_time").
		From("connection").
		Where(sq.Eq{"from_station": from}).
		Where(sq.Eq{"to_station": to}).
		RunWith(tx).QueryRow().
		Scan(&fromID, &toID, &connection.TypicalSeconds)
	if err != nil {
		return &connection, errors.New("GetConnection: " + err.Error())
	}
	connection.From, err = GetStation(tx, fromID)
	if err != nil {
		return &connection, errors.New("GetConnection: " + err.Error())
	}
	connection.To, err = GetStation(tx, toID)
	if err != nil {
		return &connection, errors.New("GetConnection: " + err.Error())
	}
	return &connection, nil
}

// Update adds or updates the connection
func (connection *Connection) Update(node sqalx.Node) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	_, err = sdb.Insert("connection").
		Columns("from_station", "to_station", "typ_time").
		Values(connection.From.ID, connection.To.ID, connection.TypicalSeconds).
		Suffix("ON CONFLICT (from_station, to_station) DO UPDATE SET typ_time = ?",
			connection.TypicalSeconds).
		RunWith(tx).Exec()

	if err != nil {
		return errors.New("AddConnection: " + err.Error())
	}
	return tx.Commit()
}

// Delete deletes the connection
func (connection *Connection) Delete(node sqalx.Node) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	_, err = sdb.Delete("connection").
		Where(sq.Eq{"from_station": connection.From.ID}).
		Where(sq.Eq{"to_station": connection.To.ID}).
		RunWith(tx).Exec()
	if err != nil {
		return fmt.Errorf("RemoveConnection: %s", err)
	}
	return tx.Commit()
}