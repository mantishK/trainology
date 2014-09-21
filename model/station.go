package model

import (
	// "fmt"

	"strconv"

	"github.com/coopernurse/gorp"
)

type Station struct {
	StationCode string  `db:"station_code"`
	StationName string  `db:"station_name"`
	Latitude    float64 `db:"latitude"`
	Longitude   float64 `db:"longitude"`
}

func (ph *Station) GetNearestStation(dbMap *gorp.DbMap, latitudeF, longitudeF float64) error {
	latitude := strconv.FormatFloat(latitudeF, 'f', 6, 64)
	longitude := strconv.FormatFloat(longitudeF, 'f', 6, 64)
	err := dbMap.SelectOne(ph, "SELECT * FROM station_info WHERE ( 3959 * acos( cos( radians('"+latitude+"') ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians('"+longitude+"') ) + sin( radians('"+latitude+"') ) * sin( radians( latitude ) ) ) )  < '300' ORDER BY ( 3959 * acos( cos( radians('"+latitude+"') ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians('"+longitude+"') ) + sin( radians('"+latitude+"') ) * sin( radians( latitude ) ) ) ) ASC LIMIT 0, 1")
	// err = dbMap.SelectOne(ph, "SELECT * FROM station_info WHERE station_code = ?", 2)
	if err != nil {
		return err
	}
	return nil
}
