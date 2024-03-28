extends Node
class_name ControlNodeFocus


@export var initial_node_to_focus: Control = null
@onready var last_focused_node: Control = self.initial_node_to_focus


func on_viewport_gui_focus_changed(control_node: Control) -> void:
	print(self.name, "Focused node: ", control_node.name)
	last_focused_node = control_node


func _ready() -> void:
	assert(initial_node_to_focus != null)
	get_tree().get_root().gui_focus_changed.connect(on_viewport_gui_focus_changed)
	
	initial_node_to_focus.grab_focus()
