extends Node2D

@onready var plataform_container = $plataform_container as Node2D
@onready var plataforma_inicial_y = $plataform_container/Plataforma.position.y
@export var plataform_scene : Array[PackedScene]  # Exporta uma cena da lista
@onready var camera := $Camera as Camera2D
@onready var player := $Player2 as CharacterBody2D
@onready var score_label := $Camera/score as Label
@onready var camera_start_position = $Camera.position.y



var score := 0
var last_plataform_is_jake := false
var last_plataform_is_reigelado := false
var last_plataform_is_caracol := false
func level_generator(amount):
	for items in amount:
		var new_type = randi() % 6
	
		plataforma_inicial_y -= randf_range(33, 47)
		# Instancia a cena de plataforma
		var new_plataform
		if new_type == 0:
			new_plataform = plataform_scene[0].instantiate() as StaticBody2D
		#jake	
		elif new_type == 1:
			if last_plataform_is_jake == false and score > 1000:
				new_plataform = plataform_scene[1].instantiate() as StaticBody2D
				last_plataform_is_jake = true
			else :
				new_plataform = plataform_scene[0].instantiate() as StaticBody2D
				last_plataform_is_jake = false
		#nuvem
		elif new_type == 2:
			new_plataform = plataform_scene[new_type].instantiate() as StaticBody2D
		#rei gelado
		elif new_type == 3:
			if last_plataform_is_reigelado == false and score > 500:
				new_plataform = plataform_scene[3].instantiate() as StaticBody2D
				last_plataform_is_reigelado = true
			else :
				new_plataform = plataform_scene[2].instantiate() as StaticBody2D
				last_plataform_is_reigelado = false
		elif new_type == 4:
			if score > 2000 and last_plataform_is_caracol == false:
				new_plataform = plataform_scene[4].instantiate() as StaticBody2D
				last_plataform_is_caracol = true
			else:
				new_plataform = plataform_scene[0].instantiate() as StaticBody2D
				last_plataform_is_caracol = false
		elif new_type == 5:
			if score > 2000 and last_plataform_is_caracol == false:
				new_plataform = plataform_scene[5].instantiate() as StaticBody2D
				last_plataform_is_caracol = true
			else:
				new_plataform = plataform_scene[2].instantiate() as StaticBody2D
				last_plataform_is_caracol = false
				
				
				
				
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
			elif new_type == 3:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.call_deferred("add_child",new_plataform)  # Adiciona a nova plataforma ao container
			elif new_type == 4:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.call_deferred("add_child",new_plataform)  # Adiciona a nova plataforma ao container
			elif new_type == 5:
				new_plataform.position = Vector2(randf_range(16, 166), plataforma_inicial_y)  # Define a posição da nova plataforma
				plataform_container.call_deferred("add_child",new_plataform)  # Adiciona a nova plataforma ao container
			

func _ready() -> void:
	level_generator(20)  # Chama o gerador de nível ao iniciar
func _physics_process(delta: float) -> void:
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
	
	score_updade()
func delete_object(obstacle):
	if obstacle.is_in_group("Player"):
		if score > Global.highscore:
			Global.highscore = score
		if get_tree().change_scene_to_file("res://Plataformas/title_screen.tscn") != OK:
			print("Algo deu errado|")
	elif obstacle.is_in_group("Plataforma") or obstacle.is_in_group("enemy"):
		obstacle.queue_free()
		level_generator(1)
		print("plataforma")
	
func _on_platform_cleaner_body_entered(body: Node2D) -> void:
	delete_object(body)
	print("Plataforma1")

func score_updade():
	score = camera_start_position - camera.position.y
	score_label.text = str(int(score))
