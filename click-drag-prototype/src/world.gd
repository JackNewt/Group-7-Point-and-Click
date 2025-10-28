extends Node2D

var A_location = ""
var C_location = ""
var N_location = ""
var T_location = ""
var paused = false
var phase = 1


func check():
	if phase == 1:
		if A_location == "Attic_snapspot":
			return true
		else:
			return false

func progress():
	phase += 1
	
