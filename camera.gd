extends Camera2D

var Lith_Scene = preload("res://Plataformas/Lith.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var caracol = "res://Plataformas/caracol.gd"
	caracol.connect("morreu_caracol", self, "spawner_lith")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func spawner_lith():
	var instance = Lith_Scene.instantiate()
	add_child(instance)
	
