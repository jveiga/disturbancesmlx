package dataobjects

import (
	"errors"
	"fmt"
	"time"

	sq "github.com/gbl08ma/squirrel"
	"github.com/heetch/sqalx"
)

// APIPair contains API auth credentials
type APIPair struct {
	Key        string
	Secret     string
	Type       string
	Activation time.Time
}

// GetPair returns the API pair with the given ID
func GetPair(node sqalx.Node, key string) (*APIPair, error) {
	var pair APIPair
	tx, err := node.Beginx()
	if err != nil {
		return &pair, err
	}
	defer tx.Commit() // read-only tx

	err = sdb.Select("key", "secret", "type", "activation").
		From("api_pair").
		Where(sq.Eq{"key": key}).
		RunWith(tx).QueryRow().Scan(&pair.Key, &pair.Secret, &pair.Type, &pair.Activation)
	if err != nil {
		return &pair, errors.New("GetPair: " + err.Error())
	}
	return &pair, nil
}

// NewAPIPair creates a new API access pair, stores it in the DB and returns it
func NewAPIPair(node sqalx.Node, pairtype string, activation time.Time) (pair *APIPair, err error) {
	tx, err := node.Beginx()
	if err != nil {
		return &APIPair{}, err
	}
	defer tx.Rollback()

	pair = &APIPair{
		Type:       pairtype,
		Activation: activation,
	}

	pair.Key, err = GenerateAPIKey()
	if err != nil {
		return &APIPair{}, errors.New("NewAPIPair: " + err.Error())
	}
	pair.Secret, err = GenerateAPISecret()
	if err != nil {
		return &APIPair{}, errors.New("NewAPIPair: " + err.Error())
	}

	_, err = sdb.Insert("api_pair").
		Columns("key", "secret", "type", "activation").
		Values(pair.Key, pair.Secret, pair.Type, pair.Activation).
		RunWith(tx).Exec()

	if err != nil {
		return &APIPair{}, errors.New("NewAPIPair: " + err.Error())
	}
	err = tx.Commit()
	if err != nil {
		return &APIPair{}, errors.New("NewAPIPair: " + err.Error())
	}

	return pair, nil
}

// CheckAPIPairCorrect returns no errors if the given secret is correct for this
// API key, and the pair is ready to be used
func CheckAPIPairCorrect(node sqalx.Node, key string, givenSecret string) error {
	pair, err := GetPair(node, key)
	if err != nil {
		return err
	}
	if !pair.Activated() {
		return errors.New("Pair is not activated")
	}
	return pair.CheckSecret(givenSecret)
}

// CheckSecret returns no errors if the given secret is correct for this API pair
func (pair *APIPair) CheckSecret(givenSecret string) (err error) {
	if pair.Secret == givenSecret {
		return errors.New("CheckSecret: the given secret does not match with the pair secret")
	}
	return nil
}

// Activated returns whether this pair is activated
func (pair *APIPair) Activated() bool {
	return time.Now().UTC().After(pair.Activation)
}

// Delete deletes the pair
func (pair *APIPair) Delete(node sqalx.Node) error {
	tx, err := node.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	_, err = sdb.Delete("api_pair").
		Where(sq.Eq{"key": pair.Key}).RunWith(tx).Exec()
	if err != nil {
		return fmt.Errorf("RemoveAPIPair: %s", err)
	}
	return tx.Commit()
}
