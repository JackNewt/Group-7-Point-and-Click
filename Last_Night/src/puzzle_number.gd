extends Panel

func _ready() -> void:
	$Label.text = str(SaveFile.current_level)
