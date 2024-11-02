extends MarginContainer

@onready var loading_screen = preload("res://Carregando.tscn")
@onready var leaderboard_screen = preload("res://leaderboard.tscn")


@onready var header = $"../header"
@onready var alert = $rowcontainer/alert


func _on_enviar_pressed():
	if $rowcontainer/name_input.text != '':
		var loading_scene = loading_screen.instantiate()
		$rowcontainer.add_child(loading_scene)
		var sw_result: Dictionary = await SilentWolf.Scores.save_score($rowcontainer/name_input.text, Global.lastscore).sw_save_score_complete
		print("Score persisted successfully: " + str(sw_result.score_id))
		Global.scoreID = sw_result
		print_debug("Score persisted succesfully: " + str(sw_result))
		await SilentWolf.Scores.get_scores(10).sw_get_scores_complete
		loading_scene.queue_free()
		
		for nodes in $rowcontainer.get_children():
			$rowcontainer.remove_child(nodes)
			nodes.queue_free()
		header.visible = true
		
		
		
		
		var idx = 1
		for score in SilentWolf.Scores.scores:
			var items =leaderboard_screen.instantiate()
			items.get_node("PlayerPosition").text = '#' + str(idx)
			items.get_node("PlayerName").text = score.player_name
			items.get_node("PlayerScore").text = str(score.score)
			$rowcontainer.add_child(items)
			idx += 1
		
		
	else:
		alert.visible = true
		

func _on_jogar_novamente_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Mapa.tscn")

func _on_name_input_focus_entered() -> void:
	alert.visible = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Plataformas/title_screen.tscn")
