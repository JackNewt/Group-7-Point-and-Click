extends Panel

var current_pic = null

func set_portrait(pic):
	if current_pic != null:
		current_pic.hide()
	if pic == 11:
		current_pic = $Avery
	elif pic == 12:
		current_pic = $AveryHappy
	elif pic == 13:
		current_pic = $AverySad
	elif pic == 21:
		current_pic = $Chip
	elif pic == 22:
		current_pic = $ChipHappy
	elif pic == 23:
		current_pic = $ChipSad
	elif pic == 31:
		current_pic = $Neve
	elif pic == 32:
		current_pic = $NeveAngry
	elif pic == 33:
		current_pic = $NeveWorried
	elif pic == 41:
		current_pic = $Tif
	elif pic == 42:
		current_pic = $TifChad
	elif pic == 43:
		current_pic = $TifHappy
	
	current_pic.show()
