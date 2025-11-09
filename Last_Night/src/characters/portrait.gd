extends Panel

var current_pic = null

func set_portrait(pic):
	if current_pic != null:
		current_pic.hide()
	if pic == 1:
		current_pic = $Avery
	elif pic == 2:
		current_pic = $Chip
	elif pic == 3:
		current_pic = $Neve
	elif pic == 4:
		current_pic = $Tif
	
	current_pic.show()
