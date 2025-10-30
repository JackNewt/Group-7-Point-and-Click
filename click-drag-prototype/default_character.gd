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
			snappedspot.hide()


func _input(event: InputEvent) -> void:
	if World.paused == false:
		if event.is_action_pressed("click") and hover == true and World.dragee == null:
			dragging = true
			World.dragee = self
		elif event.is_action_released("click"):
			dragging = false
			World.dragee = null



@warning_ignore("unused_parameter")
func _on_mouse_shape_entered(shape_idx: int) -> void:
	hover = true


@warning_ignore("unused_parameter")
func _on_mouse_shape_exited(shape_idx: int) -> void:
	hover = false


func _on_area_2d_area_entered(area: Area2D) -> void:

	if area.is_in_group("Snapspots") and area.is_in_group("Inuse") == false and area.is_in_group("Characters") == false:
		snappedspot = area
		area.add_to_group("Inuse")
		set_world()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("Inuse") and area == snappedspot:
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
	print("A = " + World.A_location)
	print("C = " + World.C_location)
	print("N = " + World.N_location)
	print("T = " + World.T_location)

func clear_world():
	if self.name == "Avery_Character":
		World.A_location = ""
	if self.name == "Chip_Character":
		World.C_location = ""
	if self.name == "Neve_Character":
		World.N_location = ""
	if self.name == "Tif_Character":
		World.T_location = ""
