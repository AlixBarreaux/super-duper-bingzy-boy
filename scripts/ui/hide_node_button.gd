extends Button
class_name HideNodeButton


@export var node: CanvasItem = null


func _ready() -> void:
	assert(node != null)
	assert(node != self)


func _on_pressed() -> void:
	node.hide()
