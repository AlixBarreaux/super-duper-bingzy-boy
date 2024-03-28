extends Label
class_name AppTitleLabel


func _ready() -> void:
	self.set_text(ProjectSettings.get_setting("application/config/name"))
