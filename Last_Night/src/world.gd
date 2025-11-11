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
		$SpeechBox/HBoxContainer/Portrait.set_portrait(11)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Oh, you guys are already up."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(21)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Avery! Sweet, the gang's all here."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(33)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Looking up from her drawing) Hey Avery, do you remember anything that happened last night? The whole house is a mess and none of us can remember why. Our cleaning fee is going to be through the roof."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(12)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Honestly, no. I can't imagine I had any part in the mess, though."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(41)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Reaching for the TV remote) Wow, Avery! Your zombie costume looks so much better today! Is that makeup under your eyes?"
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(11)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "I didn't change anything."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(42)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Crushing the remote in her hand) Huh, it must just be your natural talent! I'm inspired."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(13)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Why are we acting like we don't know who wrecked this place? Just look at her. I'm not paying the cleaning fee."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(32)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "(Clenching her fist) Well, since none of us can remember, we're not placing the blame on anyone."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(22)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Yeah, come on guys. If we all work together, we can surely piece together what happened."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(43)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "I like your spirit, Chip! Let's figure this out!"
		await $Timer.timeout
		$SpeechBox.hide()
		paused = false
	if SaveFile.current_level == 2 and get_tree().current_scene.get_name() == "world":
		paused = true
		$SpeechBox.show()
		$SpeechBox/HBoxContainer/Portrait.set_portrait(23)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Okay... yeah, I remember now. Sorry guys, the tub must've been running. I guess I built a dam."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(12)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "It's okay, Chip. Now that I'm in this room, I remember that oaf running straight through the wall to get here."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(43)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "My bad Avery! I must have just been so excited to see you! "
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(32)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Don't act like you're free of blame Avery! I remember hearing you below me in the living room when I was reading last night! The walls are all scuffed up."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(11)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "That was almost certainly Tif. I remember being here in the dining room."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(41)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "I was cooking up a meal for you Avery! You said you wanted one when you walked through the kitchen. I guess it could've been me though, sorry guys!"
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(32)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "No Tif, it wasn't you."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(21)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Avery, it's okay if you added to the mess. Nobody's perfect."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(13)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Okay, maybe I did screw up the walls. They were so ugly I couldn't stand them. Whatever. I'll help you guys clean up."
		await $Timer.timeout
		$SpeechBox/HBoxContainer/Portrait.set_portrait(42)
		$SpeechBox/HBoxContainer/TextBox/Label.text = "Yeah Avery! Let's lock in gang!"
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
	$Button.play()
	World.paused = true
	$Pause_Menu.show()

func _on_resume_pressed() -> void:
	$Button.play()
	World.paused = false
	$Pause_Menu.hide()

func _on_quit_to_menu_pressed() -> void:
	$Button.play()
	get_tree().change_scene_to_file("res://src/main_menu.tscn")
	World.paused = false


func _on_check_pressed() -> void:
	$Button.play()
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
			$SpeechBox/HBoxContainer/Portrait.set_portrait(22)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "Wow! The house looks great now! Maybe even better than before!"
			await $Timer.timeout
			$SpeechBox/HBoxContainer/Portrait.set_portrait(43)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "Good work, team! Chip, your craftsmanship is crazy good! I can't even tell the difference!"
			await $Timer.timeout
			$SpeechBox/HBoxContainer/Portrait.set_portrait(31)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "Yeah! And thanks for finding that paint for me, Avery, I don't know what I would've done without it."
			await $Timer.timeout
			$SpeechBox/HBoxContainer/Portrait.set_portrait(12)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "It was buried under so much stuff, but I guess I got lucky. Wait, the wall isn't ugly anymore! It looks great, how did you do that? And how did the leak get fixed?"
			await $Timer.timeout
			$SpeechBox/HBoxContainer/Portrait.set_portrait(42)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "I just went up and bent the pipes back together. Easy peasey!"
			await $Timer.timeout
			$SpeechBox/HBoxContainer/Portrait.set_portrait(12)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "Impressive. Wow, I was sure we would have to pay a big fee. I can't believe we got it all done!"
			await $Timer.timeout
			$SpeechBox/HBoxContainer/Portrait.set_portrait(21)
			$SpeechBox/HBoxContainer/TextBox/Label.text = "I guess we just make a great team! We better get out though, check out is in five minutes!"
			await $Timer.timeout
			$VICTORY.show()
			await get_tree().create_timer(4).timeout
			get_tree().change_scene_to_file("res://src/main_menu.tscn")
	else:
		$Panel/HBoxContainer/Check.text = "Nope, try again!"
		await get_tree().create_timer(2).timeout
		$Panel/HBoxContainer/Check.text = "Check?"


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()


func _on_audio_stream_player_2d_2_finished() -> void:
	$AudioStreamPlayer2D.play()
