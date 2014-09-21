package filters

import (
	// "fmt"
	"github.com/filmtwine/backend/config"
	// "github.com/filmtwine/backend/core/apperror"
	"net/http"
	"time"

	"github.com/filmtwine/backend/core/apperror"
	"github.com/filmtwine/backend/model"
	"github.com/filmtwine/backend/views"
)

type Authorize struct {
}

func (a *Authorize) Filter(writer http.ResponseWriter, req *http.Request, filterData map[string]interface{}) bool {
	token := req.Header.Get("X-TOKEN")
	view := views.NewView(writer)
	if token == "" {
		view.RenderHttpError("You are unauthorized!!", 401)
		return false
	}
	dbMap := config.NewConnection()
	userToken := model.UserToken{}
	userToken.Token = token
	err := userToken.GetUserIdFromToken(dbMap)
	if err != nil || userToken.UserId == 0 {
		view.RenderHttpError("You are unauthorized!!", 401)
		return false
	}
	now := time.Now()
	timeDifference, err := time.ParseDuration("168h")
	if err != nil {
		view.RenderHttpError("This is not good, something went wrong!!", 500)
		return false
	}
	timeDifferencePlusModified := userToken.Modified.Add(timeDifference)
	if now.After(timeDifferencePlusModified) {
		view.RenderErrorJson(apperror.NewTokenExpiredError(""))
		return false
	}
	filterData["UserId"] = userToken.UserId
	filterData["UserToken"] = token
	return true
}

type PartialAuthorize struct {
}

func (a *PartialAuthorize) Filter(writer http.ResponseWriter, req *http.Request, filterData map[string]interface{}) bool {
	token := req.Header.Get("X-TOKEN")
	view := views.NewView(writer)
	if token == "" {
		view.RenderHttpError("You are unauthorized!!", 401)
		return false
	}
	dbMap := config.NewConnection()
	userToken := model.UserToken{}
	userToken.Token = token
	err := userToken.GetUserIdFromToken(dbMap)
	if err != nil || userToken.UserId == 0 {
		view.RenderHttpError("You are unauthorized!!", 401)
		return false
	}
	filterData["UserId"] = userToken.UserId
	filterData["UserToken"] = token
	return true
}
