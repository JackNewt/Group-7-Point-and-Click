extends CharacterBody2D

var dragging = false
var hover = false
var snappedspot = null

func _process(delta: float) -> void:
	if dragging == true:
		global_position = get_global_mouse_position()
	elif dragging == false and snappedspot != null:
		global_position == snappedspot.global_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and hover == true:
		dragging = true
	elif event.is_action_released("click"):
		dragging = false


func _on_mouse_shape_entered(shape_idx: int) -> void:
	hover = true


func _on_mouse_shape_exited(shape_idx: int) -> void:
	hover = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	snappedspot = area
