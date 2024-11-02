extends CharacterBody2D


const SPEED = 140.0
const JUMP_VELOCITY = -450.0
var screen_size
var velocidade = Vector2.ZERO
@onready var bounce_fx = $bounce_fx as AudioStreamPlayer


func  _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		bounce_fx.play()
		velocity.y = JUMP_VELOCITY 
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#sair do oytro lado
	position.x = wrapf(position.x, 0, screen_size.x)
	
	

#Animação do Player
@onready var _animated_sprite = $AnimatedSprite2D2 as AnimatedSprite2D

func _process(_delta):
	#if Global.skin == "Finn":#animação finn
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.play("Direita"+ Global.skin)
		else: if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("Esquerda"+ Global.skin)
		else:
			_animated_sprite.play("Parado"+ Global.skin)
			
		
			
@onready var grito = $Grito
func die():
	set_collision_mask_value(2, false)
	set_collision_mask_value(3, false)
	velocity.y = 10
	await get_tree().create_timer(1.75).timeout
	get_tree().change_scene_to_file("res://RANKING.tscn")
	
	
