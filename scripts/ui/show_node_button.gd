extends Button
class_name ShowNodeButton


@export var node: CanvasItem = null


func _ready() -> void:
	assert(node != null, "node can't be null!")
	assert(node != self, "node can't be the node this script is attached to!")


func _on_pressed() -> void:
	node.show()
