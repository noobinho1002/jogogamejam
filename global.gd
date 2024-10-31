extends Node


var highscore := 0
		
#Finn / Jake
var skin = "Finn"


#leaderboard
var lastscore := 0
var scoreID

func _ready():
	SilentWolf.configure({
		"api_key": "0RHusT5LMP8e4oDZGHY3Lao90JPYCQtP9aegcAfs",
		"game_id": "doodlejumphoradeaventura1",
		"game_version": "1.0",
		"log_level": 1
	})
