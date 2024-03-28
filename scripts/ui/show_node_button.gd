extends Button
class_name ShowNodeButton


@export var node: CanvasItem = null


func _ready() -> void:
	assert(node != null)
	assert(node != self)


func _on_pressed() -> void:
	node.show()
