extends Node
class_name Game


@onready var stats: Stats = $Stats
@onready var level: Level = null
@onready var in_game_canvas_layer: CanvasLayer = $InGameCanvasLayer

signal level_loaded


func on_node_added(node: Node) -> void:
	if node is Level:
		print(self.name, ": Level added!")
		level = node
		self.level_loaded.emit()


func _ready() -> void:
	get_tree().node_added.connect(on_node_added)
