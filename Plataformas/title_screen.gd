extends Control

@onready var highscore := $Main/highscore as Label

func _ready() -> void:
	highscore.text = "HIGHSCORE\n" + str(Global.highscore)

func _on_start_button_pressed() -> void:
	if get_tree().change_scene_to_file("res://Mapa.tscn") != OK:
		print("Algo deu errado|")


func _on_quit_button_pressed() -> void:
	get_tree().quit()