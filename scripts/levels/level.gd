extends Node2D
class_name Level


@export_file var next_scene_to_load_file_path: String = ""

@onready var actors: Actors = $Actors


signal loaded(node_name: String)
signal completed

func on_completed() -> void:
	self.completed.emit()
	ScenesManager.switch_node_to_scene_file_path(self, next_scene_to_load_file_path)


func _ready() -> void:
	print(self.name, ": Loaded and ready!")
	loaded.emit(self.get_name())
	#assert(next_scene_to_load_file_path != "", "The next scene to load must be provided!")
