extends Node2D

var A_location = ""
var C_location = ""
var N_location = ""
var T_location = ""
var paused = false
var dragee = null
var solved = false

func _ready() -> void:
	SaveFile.current_level = int(load_from_file())
	if $PuzzleNumber != null:
		$PuzzleNumber/Label.text = str(SaveFile.current_level)

func save_to_file(content):
	var file = FileAccess.open("res://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

func load_from_file():
	var file = FileAccess.open("res://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	return content

func check():
	if SaveFile.current_level == 1:
		if World.A_location == "DiningRoom_snapspot" and World.C_location == "Bathroom_snapspot" and World.N_location == "Library_snapspot" and World.T_location == "Kitchen_snapspot":
			return true
	if SaveFile.current_level == 2:
		if World.A_location == "LivingRoom_snapspot" and World.C_location == "Kitchen_snapspot" and World.N_location == "Bedroom_snapspot" and World.T_location == "Attic_snapspot":
			return true
		else:
			return false

func progress():
	SaveFile.current_level += 1

func _on_pause_button_pressed() -> void:
	World.paused = true
	$Pause_Menu.show()

func _on_resume_pressed() -> void:
	World.paused = false
	$Pause_Menu.hide()

func _on_quit_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://src/main_menu.tscn")
	World.paused = false


func _on_check_pressed() -> void:
	if World.check() == true and World.solved != true:
		World.solved = true
		World.paused = true
		$Panel/HBoxContainer/Check.text = "Solved!"
		await get_tree().create_timer(4).timeout
		progress()
		get_tree().reload_current_scene()
		$PuzzleNumber/Label.text = str(SaveFile.current_level)
		World.solved = false
		World.paused = false
