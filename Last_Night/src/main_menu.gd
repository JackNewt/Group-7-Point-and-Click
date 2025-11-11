extends Control


func _on_new_game_pressed() -> void:
	$Button.play()
	SaveFile.current_level = 1
	World.save_to_file(SaveFile.current_level)
	get_tree().change_scene_to_file("res://src/world.tscn")

func _on_continue_pressed() -> void:
	$Button.play()
	get_tree().change_scene_to_file("res://src/world.tscn")

func _on_quit_pressed() -> void:
	$Button.play()
	World.save_to_file(SaveFile.current_level)
	get_tree().quit()


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()


func _on_audio_stream_player_2d_2_finished() -> void:
	$AudioStreamPlayer2D.play()
