extends Button
class_name LevelSelectorUI


const LEVELS_DIRECTORY: String = "res://scenes/levels/"
@export var next_level_to_load_file_name: String = ""
@onready var next_level_to_load_file_path: String = LEVELS_DIRECTORY + next_level_to_load_file_name + ".tscn"

signal level_selected(level_file_path: String)


func _ready() -> void:
	assert(next_level_to_load_file_name != "", "Value not provided!")
	print("name: ", next_level_to_load_file_name)
	print(next_level_to_load_file_path)
	assert(FileAccess.file_exists(next_level_to_load_file_path), "The Level to load file path is invalid!")


func _on_pressed() -> void:
	accept_event()
	level_selected.emit(next_level_to_load_file_path)
