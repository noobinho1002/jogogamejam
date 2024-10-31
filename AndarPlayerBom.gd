extends CharacterBody2D


const SPEED = 140.0
const JUMP_VELOCITY = -450.0
var screen_size
var velocidade = Vector2.ZERO
func  _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta



	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY 
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#Animação do Player
@onready var _animated_sprite = $AnimatedSprite2D2 as AnimatedSprite2D

func _process(_delta):
	if Global.skin == "Finn":#animação finn
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.play("DireitaFinn")
		else: if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("EsquerdaFinn")
		else:
			_animated_sprite.play("ParadoFinn")
	elif Global.skin == "Jake":
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.play("DireitaJake")
		else: if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("EsquerdaJake")
		else:
			_animated_sprite.play("ParadoJake")

func die():
	set_collision_mask_value(2, false)
	set_collision_mask_value(3, false)
	velocity.y = 1000
	#get_tree().change_scene_to_file("res://Plataformas/title_screen.tscn")
		
	
