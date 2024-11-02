extends Control

@onready var highscore := $Main/highscore as Label

func _ready() -> void:
	highscore.text = "HIGHSCORE\n" + str(Global.highscore)

func _on_start_button_pressed() -> void:
	if get_tree().change_scene_to_file("res://Mapa.tscn") != OK:
		print("Algo deu errado|")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


var SKINS = ["Finn", "Jake", "BMO", "Jujuba", "Marceline", "Fiona", "Cake"]
var skinNum = 1

func mudarSkin():
   #Escolhe a skin
	Global.skin = SKINS[skinNum]
	#add a prox da lista
	skinNum += 1
	#verifica se é a ultima skin para voltar pro inicio
	if skinNum >= SKINS.size():
		skinNum = 0


func _on_selecinar_finn_pressed() -> void:
	mudarSkin()

	

	
