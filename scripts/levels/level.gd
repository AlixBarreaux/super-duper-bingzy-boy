extends Node2D
class_name Level


const LEVELS_DIRECTORY: String = "res://scenes/levels/"
@export var next_level_to_load_file_name: String = ""
@onready var next_scene_to_load_file_path: String = LEVELS_DIRECTORY + next_level_to_load_file_name + ".tscn"

@onready var actors: Actors = $Actors


signal completed

func on_completed() -> void:
	self.completed.emit()
	ScenesManager.switch_node_to_scene_file_path(self, next_scene_to_load_file_path)


func _ready() -> void:
	assert(next_scene_to_load_file_path != "", "The next scene to load must be provided!")
