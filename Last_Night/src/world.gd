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
	if SaveFile.current_level == 1 and get_tree().current_scene.get_name() == "world":
		paused = true
		$SpeechBox.show()
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Walking down the stairs, into the living room)"
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(1)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Oh, you guys are already up."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(2)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Avery! Sweet, the gang's all here."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(3)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Looking up from her drawing) Hey Avery, do you remember anything that happened last night? The whole house is a mess and none of us can remember why. Our cleaning fee is going to be through the roof."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(1)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Honestly, no. I can't imagine I had any part in the mess, though."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(4)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Reaching for the TV remote) Wow, Avery! Your zombie costume looks so much better today! Is that makeup under your eyes?"
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(1)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "I didn't change anything."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(4)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Crushing the remote in her hand) Huh, it must just be your natural talent! I'm inspired."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(1)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Why are we acting like we don't know who wrecked this place? Just look at her. I'm not paying the cleaning fee."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(3)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Clenching her fist) Well, since none of us can remember, we're not placing the blame on anyone."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(2)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Yeah, come on guys. If we all work together, we can surely piece together what happened."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(4)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "I like your spirit, Chip! Let's figure this out!"
		await $Timer.timeout
		$SpeechBox.hide()
		paused = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and $Timer != null:
		$Timer.start()
	


func save_to_file(content):
	var file = FileAccess.open("res://save_game.dat", FileAccess.WRITE)
	file.store_string(str(content))

func load_from_file():
	var file = FileAccess.open("res://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	return content

func check():
	if SaveFile.current_level == 1:
		if World.A_location == "DiningRoom_snapspot" and World.C_location == "Bathroom_snapspot" and World.N_location == "Library_snapspot" and World.T_location == "Kitchen_snapspot":
			return true
	elif SaveFile.current_level == 2:
		if World.A_location == "Attic_snapspot" and World.C_location == "Kitchen_snapspot" and World.N_location == "LivingRoom_snapspot" and World.T_location == "Bathroom_snapspot":
			return true
	else:
		return false

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
		if SaveFile.current_level == 1:
			World.solved = true
			World.paused = true
			$Panel/HBoxContainer/Check.text = "Solved!"
			$SpeechBox.show()
			$VICTORY.show()
			await get_tree().create_timer(4).timeout
			SaveFile.current_level = 2
			save_to_file(SaveFile.current_level)
			get_tree().reload_current_scene()
			World.solved = false
			World.paused = false
		elif SaveFile.current_level == 2:
			$SpeechBox.show()
			$VICTORY.show()
			await get_tree().create_timer(4).timeout
			get_tree().change_scene_to_file("res://src/main_menu.tscn")
