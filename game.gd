extends Node2D

@onready var plataform_container = $plataform_container as Node2D
@onready var plataforma_inicial_y = $plataform_container/Plataforma.position.y
@export var plataform_scene : Array[PackedScene]  # Exporta uma cena da lista
@onready var camera := $Camera as Camera2D
@onready var player := $Player2 as CharacterBody2D
@onready var score_label := $Camera/score as Label
@onready var camera_start_position = $Camera.position.y



var score = 0
var last_plataform_is_jake := false
func level_generator(amount):
	for items in amount:
		var new_type = randi() % 3 
	
		plataforma_inicial_y -= randf_range(65, 90)
		# Instancia a cena de plataforma
		var new_plataform
		if new_type == 0:
			new_plataform = plataform_scene[0].instantiate() as StaticBody2D
		elif new_type == 1:
			if last_plataform_is_jake == false:
				new_plataform = plataform_scene[1].instantiate() as StaticBody2D
				last_plataform_is_jake = true
			else :
				new_plataform = plataform_scene[0].instantiate() as StaticBody2D
				last_plataform_is_jake = false
		elif new_type == 2:
			new_plataform = plataform_scene[2].instantiate() as StaticBody2D
		#Localização de cada plataforma
		if new_type != null:
			#Padrao
			if new_type == 0:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.call_deferred("add_child",new_plataform)  # Adiciona a nova plataforma ao container
				#plataforma Jake
			elif new_type == 1:
				new_plataform.position = Vector2(randf_range(43, 139), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.call_deferred("add_child",new_plataform)  # Adiciona a nova plataforma ao container
			elif new_type == 2:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.call_deferred("add_child",new_plataform)  # Adiciona a nova plataforma ao container

func _ready() -> void:
	level_generator(10)  # Chama o gerador de nível ao iniciar
func _physics_process(delta: float) -> void:
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
	
	score_updade()
func delete_object(obstacle):
	if obstacle.is_in_group("Player"):
		print("foi o player")
	elif obstacle.is_in_group("Plataforma"):
		obstacle.queue_free()
		level_generator(1)
		print("plataforma")
	
func _on_platform_cleaner_body_entered(body: Node2D) -> void:
	delete_object(body)
	print("Plataforma1")

func score_updade():
	score = camera_start_position - camera.position.y
	score_label.text = str(int(score))
