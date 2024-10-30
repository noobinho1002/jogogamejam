extends StaticBody2D

func response():
	emit_signal("delete_object", self)
	

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and body.has_method("die"):
		body.die()
