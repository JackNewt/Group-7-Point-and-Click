extends Control


func _on_new_game_pressed() -> void:
	SaveFile.current_level = 1
	World.save_to_file(SaveFile.current_level)
	get_tree().change_scene_to_file("res://src/world.tscn")

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://src/world.tscn")

func _on_quit_pressed() -> void:
	World.save_to_file(SaveFile.current_level)
	get_tree().quit()
