extends Button
class_name LevelSelectorUI


@export_file var level_to_load_file_path: String = ""

signal level_selected(level_file_path: String)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			accept_event()
			level_selected.emit(level_to_load_file_path)


func _ready() -> void:
	assert(FileAccess.file_exists(level_to_load_file_path), "The Level to load file path is invalid!")
