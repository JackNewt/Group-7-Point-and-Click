extends CharacterBody2D


var dragging = false
var hover = false
var snappedspot = null

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if World.paused == false:
		if dragging == true:
			global_position = get_global_mouse_position()
			if snappedspot != null:
				snappedspot.show()
		elif dragging == false and snappedspot != null:
			global_position = snappedspot.global_position
			if World.check() == true:
				print("Solved!")
				World.paused = true
			snappedspot.hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and hover == true and Global.dragee == null:
		dragging = true
		Global.dragee = self
	elif event.is_action_released("click"):
		dragging = false
		Global.dragee = null


@warning_ignore("unused_parameter")
func _on_mouse_shape_entered(shape_idx: int) -> void:
	hover = true


@warning_ignore("unused_parameter")
func _on_mouse_shape_exited(shape_idx: int) -> void:
	hover = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if snappedspot != null:
		area.remove_from_group("Inuse")
		clear_world()
	if area.is_in_group("Snapspots") and area.is_in_group("Inuse") == false and area.is_in_group("Characters") == false:
		snappedspot = area
		area.add_to_group("Inuse")
		set_world()
		World.check()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area == snappedspot:
		snappedspot = null
		area.remove_from_group("Inuse")
		clear_world()

func set_world():
	if self.name == "Avery_Character":
		World.A_location = snappedspot.name
	if self.name == "Chip_Character":
		World.C_location = snappedspot.name
	if self.name == "Neve_Character":
		World.N_location = snappedspot.name
	if self.name == "Tif_Character":
		World.T_location = snappedspot.name

func clear_world():
	if self.name == "Avery_Character":
		World.A_location = ""
	if self.name == "Chip_Character":
		World.C_location = ""
	if self.name == "Neve_Character":
		World.N_location = ""
	if self.name == "Tif_Character":
		World.T_location = ""
