extends HBoxContainer
class_name LivesCounterUI


@onready var label: Label = $Label


func on_lives_changed() -> void:
	#self.label.set_text("x " + str(Global.lives))
	pass


func _ready() -> void:
	#self.label.set_text("x " + str(Global.lives))
	#Global.lives_changed.connect(on_lives_changed)
	pass
