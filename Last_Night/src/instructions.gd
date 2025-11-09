extends Panel

func _ready() -> void:
	if SaveFile.current_level == 2:
		$HBoxContainer/A/TextureRect.hide()
		$HBoxContainer/C/TextureRect.hide()
		$HBoxContainer/N/TextureRect.hide()
		$HBoxContainer/T/TextureRect.hide()
		$Label.text = "The gang made quite the mess. Now they gotta work together to fix it! Click the Numbers below to see what needs done."

func _on_a_pressed() -> void:
	if SaveFile.current_level == 1:
		$Label.text = "Avery Says:
		I spent a lot of the night in the Dining Room. I remember a leak coming ceiling."
	if SaveFile.current_level == 2:
		$Label.text = "Tif Punched a hole in the wall. We need someone good with walls to fix it!"


func _on_c_pressed() -> void:
	if SaveFile.current_level == 1:
		$Label.text = "Chip Says:
		Last night was such a blur! I can hardly remember what I even did, only that everyone thought my Beaver Costume was fitting!"
	if SaveFile.current_level == 2:
		$Label.text = "The paint in the Living Room is scuffed. We need someone Artsy to Paint over it!"

func _on_n_pressed() -> void:
	if SaveFile.current_level == 1:
		$Label.text = "Neve Says:
		I mostly kept to myself, althought I did get a lot of reading done once things quieted down for the night."
	if SaveFile.current_level == 2:
		$Label.text = "Someone familiar with Dark Places should visit the Attic and search for supplies!"


func _on_t_pressed() -> void:
	if SaveFile.current_level == 1:
		$Label.text = "Tif Says:
		It was my job to make dinner last night, although I remember the door getting kinda stuck. I might have used my skills to, 'solve that'."
	if SaveFile.current_level == 2:
		$Label.text = "Chip did a number on the Pipes in the bathroom. Someone needs to bend all these pipes back in place!"
