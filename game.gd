extends Node2D

@onready var plataform_container = $plataform_container
@onready var plataforma_inicial_y = $plataform_container/Plataforma.position.y
@export var plataform_scene : Array[PackedScene]  # Exporta uma cena da lista

func level_generator(amount):
	for items in amount:
		var new_type = randi() % 3 
	
		plataforma_inicial_y -= randf_range(65, 90)
		# Instancia a cena de plataforma
		var new_plataform
		if new_type == 0:
			new_plataform = plataform_scene[0].instantiate() as StaticBody2D
		elif new_type == 1:
			new_plataform = plataform_scene[1].instantiate() as StaticBody2D
		elif new_type == 2:
			new_plataform = plataform_scene[2].instantiate() as StaticBody2D
		#Localização de cada plataforma
		if new_type != null:
			#Padrao
			if new_type == 0:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.add_child(new_plataform)  # Adiciona a nova plataforma ao container
				#plataforma Jake
			elif new_type == 1:
				new_plataform.position = Vector2(randf_range(43, 139), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.add_child(new_plataform)  # Adiciona a nova plataforma ao container
			elif new_type == 2:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.add_child(new_plataform)  # Adiciona a nova plataforma ao container
				
func _ready() -> void:
	level_generator(20)  # Chama o gerador de nível ao iniciar
