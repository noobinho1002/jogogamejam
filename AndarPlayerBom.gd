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
	
	#Limite De Tela Para o Player
	position += velocidade * delta
	position = position.clamp(Vector2.ZERO, 	screen_size)
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



#Animação do Player
@onready var _animated_sprite = $AnimatedSprite2D2 as AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("Direita")
	else: if Input.is_action_pressed("ui_left"):
		_animated_sprite.play("Esquerda")
	else:
		_animated_sprite.play("parado")
