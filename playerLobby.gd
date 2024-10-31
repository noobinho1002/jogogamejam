extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D as AnimatedSprite2D

func _process(delta: float) -> void:
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.play("Direita"+ Global.skin)
		else: if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("Esquerda"+ Global.skin)
		else:
			_animated_sprite.play("Parado"+ Global.skin)
