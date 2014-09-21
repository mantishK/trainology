package router

import (
	"net/http"
	"strings"

	"github.com/filmtwine/backend/filters"
	"github.com/filmtwine/backend/views"
)

type router struct {
	routeMethodMap  map[string]map[string]func(http.ResponseWriter, *http.Request, map[string]interface{})
	routerFilterMap map[string]map[string][]filters.Filterable
}

func New() *router {
	newRouter := new(router)
	newRouter.routeMethodMap = make(map[string]map[string]func(http.ResponseWriter, *http.Request, map[string]interface{}))
	newRouter.routerFilterMap = make(map[string]map[string][]filters.Filterable)
	return newRouter
}

func (r *router) setMethodMap(httpMethod, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice []filters.Filterable) {
	if !strings.HasSuffix(route, "/") {
		route = route + "/"
	}
	if r.routeMethodMap[route] == nil {
		r.routeMethodMap[route] = make(map[string]func(http.ResponseWriter, *http.Request, map[string]interface{}))
	}
	if len(filterSlice) != 0 {
		if r.routerFilterMap[route] == nil {
			r.routerFilterMap[route] = make(map[string][]filters.Filterable)
			if r.routerFilterMap[route][httpMethod] == nil {
				r.routerFilterMap[route][httpMethod] = make([]filters.Filterable, 0, 5)
			}
		}
		for i := range filterSlice {
			r.routerFilterMap[route][httpMethod] = append(r.routerFilterMap[route][httpMethod], filterSlice[i])
		}
	}
	r.routeMethodMap[route][httpMethod] = newControllerMethod
}

func (r *router) Get(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("GET", versionName+route, newControllerMethod, filterSlice)
}

func (r *router) Post(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("POST", versionName+route, newControllerMethod, filterSlice)
}

func (r *router) Put(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("PUT", versionName+route, newControllerMethod, filterSlice)
}

func (r *router) Delete(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("DELETE", versionName+route, newControllerMethod, filterSlice)
}

func (r *router) Head(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("HEAD", versionName+route, newControllerMethod, filterSlice)
}

func (r *router) Options(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("OPTIONS", versionName+route, newControllerMethod, filterSlice)
}

func (r *router) Trace(versionName, route string, newControllerMethod func(http.ResponseWriter, *http.Request, map[string]interface{}),
	filterSlice ...filters.Filterable) {
	r.setMethodMap("TRACE", route, newControllerMethod, filterSlice)
}

func (r *router) ServeHTTP(writer http.ResponseWriter, req *http.Request) {
	method := req.Method
	requestURI := strings.Split(req.RequestURI, "?")[0]
	if !strings.HasSuffix(requestURI, "/") {
		requestURI = requestURI + "/"
	}

	filterData := make(map[string]interface{})
	filterReturnVal := r.executeFilters(method, requestURI, writer, req, filterData)
	if filterReturnVal == true {
		if r.routeMethodMap[requestURI][method] != nil {
			r.routeMethodMap[requestURI][method](writer, req, filterData)
		} else {
			view := views.NewView(writer)
			view.RenderHttpError("404!! Not Found", 404)
		}
	}
}

func (r *router) executeFilters(method, requestURI string, writer http.ResponseWriter, req *http.Request, filterData map[string]interface{}) bool {
	filtersSlice := r.routerFilterMap[requestURI][method]
	for i := range filtersSlice {
		returnVal := r.routerFilterMap[requestURI][method][i].Filter(writer, req, filterData)
		if returnVal == false {
			return false
		}
	}
	return true
}
