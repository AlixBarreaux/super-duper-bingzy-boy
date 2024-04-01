extends Panel
class_name LevelSelectionUI


@onready var levels_container: HBoxContainer = $LevelsContainer


var level_to_load_file_path: String = ""

func load_game() -> void:
	ScenesManager.load_level(level_to_load_file_path)


func on_level_selected(level_file_path: String) -> void:
	level_to_load_file_path = level_file_path
	self.queue_free()


func _ready() -> void:
	for level_selector_ui in levels_container.get_children():
		level_selector_ui.level_selected.connect(on_level_selected)


func _exit_tree() -> void:
	load_game()
