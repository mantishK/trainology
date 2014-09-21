package filters

import (
	// "fmt"
	"github.com/filmtwine/backend/views"
	"net/http"
)

type Authenticate struct {
}

func (a *Authenticate) Filter(writer http.ResponseWriter, req *http.Request, filterData map[string]interface{}) bool {
	Authenticated := true
	if !Authenticated {
		view := views.NewView(writer)
		result := make(map[string]interface{})
		result["error"] = "Authentication Error"
		result["response"] = "error"
		view.RenderJson(result)
	}
	return Authenticated
}
