extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D as AnimatedSprite2D

func _process(delta: float) -> void:
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
