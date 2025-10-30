extends Area2D

func _on_mouse_shape_entered(shape_idx: int) -> void:
	$Sprite2D.scale = Vector2(4,4)


func _on_mouse_shape_exited(shape_idx: int) -> void:
	$Sprite2D.scale = Vector2(3,3)
