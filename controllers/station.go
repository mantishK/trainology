package controllers

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	"strings"

	"github.com/coopernurse/gorp"
	"github.com/mantishK/trainology/core/apperror"
	"github.com/mantishK/trainology/core/validate"
	"github.com/mantishK/trainology/model"
	"github.com/mantishK/trainology/views"
)

type PathReturnFormat struct {
	Lat   float64
	Long  float64
	Name  string
	Train string
	Order int
}

type PathRealReturnFormat struct {
	lat   float64
	long  float64
	name  string
	train string
	order int
}

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
	result["name"] = strings.Split(station.StationName, "(")[0]
	view.RenderJson(result)
}

func (c *Station) GetShortestPath(w http.ResponseWriter, r *http.Request, filterData map[string]interface{}) {
	view := views.NewView(w)
	dbMap, _, params := Init(w, r)
	requiredFields := []string{"source", "destination"}
	count, err := validate.RequiredParams(params, requiredFields)
	if err != nil {
		view.RenderErrorJson(apperror.NewRequiredError(err.Error(), requiredFields[count]))
		return
	}

	source := params.Get("source")
	destination := params.Get("destination")
	// returnsArray := make([]model.PathReturnFormat, 5, 5)
	// returnsArray = model.GetShortestPath(dbMap, source, destination, returnsArray)

	sourceId, _ := getNeoId(dbMap, source)
	destinationId, _ := getNeoId(dbMap, destination)

	baseUrl := "http://54.86.157.245:8080/db/data/node/" + strconv.Itoa(sourceId) + "/path"
	mapData := make(map[string]interface{})
	mapData["to"] = "http://54.86.157.245:8080/db/data/node/" + strconv.Itoa(destinationId)
	mapData["max_depth"] = 5
	mapData["relationships"] = make(map[string]interface{})
	relationship := make(map[string]string)
	relationship["type"] = "connects"
	relationship["direction"] = "out"
	mapData["relationships"] = relationship
	mapData["algorithm"] = "shortestPath"

	buf, _ := json.Marshal(mapData)
	body := bytes.NewBuffer(buf)
	fmt.Println(body)
	fmt.Println(baseUrl)
	resp, err := http.Post(baseUrl, "application/json", body)
	if err != nil {
		fmt.Println(err)
		view.RenderHttpError("No Trains !!", 404)
		return
	}
	if resp.Status != "200 OK" && resp.Status != "201" {
		fmt.Println(resp.Status)
		fmt.Println("in error")
		view.RenderHttpError("No Trains !!", 404)
		return
	}
	var result interface{}
	bodyBuffer := new(bytes.Buffer)
	bodyBuffer.ReadFrom(resp.Body)
	bodyBytes := bodyBuffer.Bytes()
	err = json.Unmarshal(bodyBytes, &result)
	resultMap := result.(map[string]interface{})
	// fmt.Println(resultMap)
	if resultMap["nodes"] == nil {
		view.RenderHttpError("No Trains !!", 404)
		return
	}
	relationshipArray := make([]interface{}, 0, 0)
	if resultMap["relationships"] != nil {
		relationshipArray = resultMap["relationships"].([]interface{})
	}
	nodesArray := resultMap["nodes"].([]interface{})
	length := len(nodesArray)
	// var returnArray []PathReturnFormat
	returnArray := make([]PathReturnFormat, length, length)
	for key, nodeInterface := range nodesArray {
		fmt.Println("nodeArray")
		fmt.Println(nodeInterface)
		node := nodeInterface.(string)
		code, _ := getCode(node, dbMap)
		returnArray[key] = getStationDetails(dbMap, code)
		fmt.Println(relationshipArray)
		if (len(relationshipArray) - 1) >= key {
			returnArray[key].Train = getTrainDetails(relationshipArray[key].(string))
		}
		returnArray[key].Order = key + 1
	}
	returnResult := make([]map[string]interface{}, len(returnArray), len(returnArray))
	for key, item := range returnArray {
		returnResult[key] = make(map[string]interface{})
		// returnResult[key].(map[string]interface{})
		returnResult[key]["lat"] = item.Lat
		returnResult[key]["lng"] = item.Long
		fmt.Println(item.Train)
		if item.Train != "" {
			returnResult[key]["train"] = item.Train
		}
		returnResult[key]["name"] = strings.Split(item.Name, "(")[0]
		returnResult[key]["order"] = item.Order
	}
	view.RenderJson(returnResult)
}

func getCode(node string, dbMap *gorp.DbMap) (string, error) {
	length := len(strings.Split(node, "/"))
	id := strings.Split(node, "/")[length-1]
	code, err := dbMap.SelectStr("SELECT code FROM neo_map WHERE id ='" + id + "'")
	if err != nil {
		fmt.Println(err)
		return "", err
	}
	return code, nil
}

func getNeoId(dbMap *gorp.DbMap, code string) (int, error) {
	id, err := dbMap.SelectInt("SELECT id FROM neo_map WHERE code ='" + code + "'")
	if err != nil {
		fmt.Println(err)
		return 0, err
	}
	return int(id), nil
}

func getStationDetails(dbMap *gorp.DbMap, code string) PathReturnFormat {
	var station model.Station
	err := dbMap.SelectOne(&station, "SELECT * FROM station_info WHERE station_code = ?", code)
	if err != nil {
		fmt.Println("error retreiving station info")
	}
	var pathReturnFormat PathReturnFormat
	pathReturnFormat.Lat = station.Latitude
	pathReturnFormat.Long = station.Longitude
	pathReturnFormat.Name = station.StationName
	return pathReturnFormat
}

func getTrainDetails(url string) string {
	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("error requesting data")
		fmt.Println(err)
		return ""
	}
	defer resp.Body.Close()
	fmt.Println(resp.Body)
	var result interface{}
	bodyBuffer := new(bytes.Buffer)
	bodyBuffer.ReadFrom(resp.Body)
	bodyBytes := bodyBuffer.Bytes()
	err = json.Unmarshal(bodyBytes, &result)
	if err != nil {
		fmt.Println("error parsing data")
		fmt.Println(err)
		return ""
	}
	resultMap := result.(map[string]interface{})
	resultsMap := resultMap["data"].(map[string]interface{})
	if len(resultsMap) == 0 {
		return ""
	}
	train := resultsMap["train"].(string)
	return train
}
