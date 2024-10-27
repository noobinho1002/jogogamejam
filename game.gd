extends Node2D

@onready var plataform_container = $plataform_container
@onready var plataforma_inicial_y = $plataform_container/Plataforma.position.y
@export var plataform_scene : PackedScene  # Exporta uma única cena

func level_generator(amount):
	for items in amount:
		plataforma_inicial_y -= randf_range(60, 80)
		# Instancia a cena de plataforma
		var new_plataform = plataform_scene.instantiate() as StaticBody2D
		new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
		plataform_container.add_child(new_plataform)  # Adiciona a nova plataforma ao container
	pass
func _ready() -> void:
	level_generator(3)  # Chama o gerador de nível ao iniciar
