package config

import (
	"database/sql"
	"fmt"
	"log"
	"strconv"
	"strings"

	"github.com/coopernurse/gorp"
	_ "github.com/go-sql-driver/mysql"
	"github.com/mantishK/trainology/model"
)

func NewConnection() *gorp.DbMap {
	dbUserName := "root"
	dbPass := ""
	dbIp := "127.0.0.1"
	dbPortNo := 3306
	dbName := "an_a_train"
	if dbPass != "" {
		dbPass = ":" + dbPass
	} else {
		dbPass = ":"
	}
	dbStringSlice := []string{dbUserName, dbPass, "@tcp(", dbIp, ":", strconv.Itoa(dbPortNo), ")/", dbName, "?parseTime=true"}
	db, err := sql.Open("mysql", strings.Join(dbStringSlice, ""))
	checkErr(err, "sql.Open failed")

	// construct a gorp DbMap
	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.MySQLDialect{Engine: "InnoDB", Encoding: "utf8"}}

	// add a table, setting the table name to 'posts' and
	// specifying that the Id property is an auto incrementing PK
	// dbmap.AddTableWithName(model.Note{}, "note").SetKeys(true, "Note_id")
	dbmap.AddTableWithName(model.Station{}, "station_info")
	// dbmap.AddTableWithName(model.UserToken{}, "user_token")
	// dbmap.AddTableWithName(model.UserForgotPassLink{}, "user_forgot_pass_link")
	// dbmap.AddTableWithName(model.UserProfile{}, "user_profile").SetKeys(false, "UserId")
	// dbmap.AddTableWithName(model.UserGenre{}, "user_genre")
	// dbmap.AddTableWithName(model.UserLanguage{}, "user_language")
	// dbmap.AddTableWithName(model.Genre{}, "genres").SetKeys(true, "GenreId")
	// dbmap.AddTableWithName(model.Language{}, "languages").SetKeys(true, "LanguageId")
	// dbmap.AddTableWithName(model.Country{}, "countries").SetKeys(true, "CountryId")
	// dbmap.AddTableWithName(model.Video{}, "videos").SetKeys(true, "VideoId")
	// dbmap.AddTableWithName(model.VideoType{}, "video_type").SetKeys(true, "VideoTypeId")
	// dbmap.AddTableWithName(model.VideoCrew{}, "video_crew")
	// dbmap.AddTableWithName(model.CrewRoles{}, "crew_roles").SetKeys(true, "CrewRoleId")
	// dbmap.AddTableWithName(model.InvitedUser{}, "invited_user").SetKeys(true, "InvitedUserId")
	// dbmap.AddTableWithName(model.VideoUserReview{}, "video_user_reviews").SetKeys(true, "ReviewId")
	// dbmap.AddTableWithName(model.ProductionHouse{}, "production_houses").SetKeys(true, "ProductionHouseId")
	// dbmap.AddTableWithName(model.ProductionHouseUser{}, "production_house_users")
	// dbmap.AddTableWithName(model.UserFollowing{}, "user_following").SetKeys(false, "UserId", "FollowingUserId")
	// dbmap.AddTableWithName(model.VideoFestival{}, "video_festival").SetKeys(false, "VideoId", "Name")
	// dbmap.AddTableWithName(model.VideoAward{}, "video_award").SetKeys(false, "VideoId", "Name")
	// dbmap.AddTableWithName(model.Message{}, "messages")
	// create the table. in a production system you'd generally
	// use a migration tool, or create the tables via scripts
	fmt.Println(dbmap)
	err = dbmap.CreateTablesIfNotExists()
	checkErr(err, "Create tables failed")

	return dbmap
}
func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}
