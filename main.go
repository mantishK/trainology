package main

import (
	"log"
	"net/http"

	"github.com/mantishK/trainology/controllers"
	"github.com/mantishK/trainology/core/router"
)

func main() {
	route()
}
func route() {
	//Create filters
	// authenticateFilter := new(filters.Authenticate)
	// authorizeFilter := new(filters.Authorize)
	// partialAuthorizeFilter := new(filters.PartialAuthorize)

	//Create controller
	stationController := controllers.Station{}

	//version
	version := make([]string, 5, 5)
	version[0] = ""
	version[1] = "/v1"

	//Create Router
	myRouter := router.New()

	//route
	for _, versionName := range version {
		//user
		myRouter.Get(versionName, "/station", stationController.GetNearestStation)
		// myRouter.Post(versionName, "/user", userController.SaveUser, authenticateFilter)
		// myRouter.Head(versionName, "/username", userController.UserNameExists, authenticateFilter)
		// myRouter.Put(versionName, "/user", userController.UpdateUser, authenticateFilter, authorizeFilter)
		// myRouter.Put(versionName, "/user/password", userController.UpdatePassword, authenticateFilter, authorizeFilter)
		// myRouter.Options(versionName, "/user", controllers.CorsOptionController)

		// //authorization
		// myRouter.Post(versionName, "/user/authorize", userController.SignIn, authenticateFilter)
		// myRouter.Delete(versionName, "/user/authorize", userController.SignOut, authenticateFilter, authorizeFilter)
		// myRouter.Put(versionName, "/user/authorize", userController.RenewToken, authenticateFilter, partialAuthorizeFilter)

		// //Forgot Password
		// myRouter.Post(versionName, "/user/forgot_pass", userController.AddForgotPasswordLink, authenticateFilter)
		// myRouter.Put(versionName, "/user/forgot_pass", userController.UpdateForgotPasswordLink, authenticateFilter)

		// //Genre
		// myRouter.Get(versionName, "/genre", genreController.GetGenres, authenticateFilter)

		// //Country
		// myRouter.Get(versionName, "/country", countryController.GetCountries, authenticateFilter)

		// //Language
		// myRouter.Get(versionName, "/language", languageController.GetLanguages, authenticateFilter)

		// //Video
		// myRouter.Get(versionName, "/video", videoController.Get, authenticateFilter, authorizeFilter)
		// myRouter.Post(versionName, "/video", videoController.Add, authenticateFilter, authorizeFilter)
		// myRouter.Delete(versionName, "/video", videoController.Delete, authenticateFilter, authorizeFilter)
		// myRouter.Put(versionName, "/video", videoController.Update, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/videos", videoController.GetAllVideos, authenticateFilter)

		// //review
		// myRouter.Post(versionName, "/review", reviewController.SaveReview, authenticateFilter, authorizeFilter)
		// myRouter.Put(versionName, "/review", reviewController.UpdateReview, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/review", reviewController.Get, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/review/child", reviewController.GetChildReviews, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/reviews", reviewController.GetVideoReviews, authenticateFilter, authorizeFilter)
		// myRouter.Delete(versionName, "/review", reviewController.Delete, authenticateFilter, authorizeFilter)

		// //Production House
		// myRouter.Get(versionName, "/production_house", productionHouse.Get, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/production_house/users", productionHouse.GetUsersProductionHouses, authenticateFilter, authorizeFilter)
		// myRouter.Post(versionName, "/production_house", productionHouse.Save, authenticateFilter, authorizeFilter)
		// myRouter.Delete(versionName, "/production_house", productionHouse.Delete, authenticateFilter, authorizeFilter)
		// myRouter.Put(versionName, "/production_house", productionHouse.Update, authenticateFilter, authorizeFilter)

		// //Production House
		// myRouter.Post(versionName, "/follow", followController.Follow, authenticateFilter, authorizeFilter)
		// myRouter.Delete(versionName, "/follow", followController.UnFollow, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/follow/followers", followController.GetFollowers, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/follow/following", followController.GetFollowing, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/follow/follows", followController.Follows, authenticateFilter, authorizeFilter)

		// //Message
		// myRouter.Post(versionName, "/message", messageController.Save, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/message", messageController.GetMessages, authenticateFilter, authorizeFilter)
		// myRouter.Get(versionName, "/message/user", messageController.GetUserMessages, authenticateFilter, authorizeFilter)

		// //Search
		// myRouter.Get(versionName, "/video/search", videoController.Search, authenticateFilter, authorizeFilter)

	}
	http.HandleFunc("/app/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, r.URL.Path[1:])
	})
	http.Handle("/", myRouter)
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatalln(err)
	}
}
