extends Area2D

@export var speed = 50

var screen_size



func  _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocidade = Vector2.ZERO
	if Input.is_action_pressed("mover_esquerda"):
		velocidade.x += -1
	if Input.is_action_pressed("mover_direirta"):
		velocidade.x += 1
	
	if velocidade.length() > 0:
		velocidade = velocidade.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocidade * delta
	position = position.clamp(Vector2.ZERO, 	screen_size)
	
	if velocidade.x != 0:
		$AnimatedSprite2D.animation = "lados"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocidade.x < 0
	elif velocidade.y == 0 and velocidade.x == 0:
		$AnimatedSprite2D.animation = "parado"
