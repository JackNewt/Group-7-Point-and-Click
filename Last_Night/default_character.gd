extends CharacterBody2D

var dragging = false
var hover = false
@export var snappedspot = null

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if World.paused == false:
		if dragging == true:
			$Sprite2D.scale = Vector2(4,4)
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
	$Sprite2D.scale = Vector2(4,4)

@warning_ignore("unused_parameter")
func _on_mouse_shape_exited(shape_idx: int) -> void:
	hover = false
	$Sprite2D.scale = Vector2(3,3)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Snapspots") and area.is_in_group("Inuse") == false and area.is_in_group("Characters") == false:
		if snappedspot != null:
			snappedspot.remove_from_group("Inuse")
		snappedspot = area
		area.add_to_group("Inuse")
		set_world()




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
