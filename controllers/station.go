package controllers

import (
	"net/http"
	"strconv"

	"github.com/mantishK/trainology/core/apperror"
	"github.com/mantishK/trainology/core/validate"
	"github.com/mantishK/trainology/model"
	"github.com/mantishK/trainology/views"
)

type Station struct {
}

func (c *Station) GetNearestStation(w http.ResponseWriter, r *http.Request, filterData map[string]interface{}) {
	view := views.NewView(w)
	dbMap, _, params := Init(w, r)
	requiredFields := []string{"latitude", "longitude"}
	count, err := validate.RequiredParams(params, requiredFields)
	if err != nil {
		view.RenderErrorJson(apperror.NewRequiredError(err.Error(), requiredFields[count]))
		return
	}

	latitude, _ := strconv.ParseFloat(params.Get("latitude"), 64)
	longitude, _ := strconv.ParseFloat(params.Get("longitude"), 64)
	station := model.Station{}
	err = station.GetNearestStation(dbMap, latitude, longitude)
	if err != nil {
		view.RenderErrorJson(apperror.NewDBError("", err))
		return
	}

	result := make(map[string]interface{})

	result["name"] = station.StationName
	view.RenderJson(result)
}
