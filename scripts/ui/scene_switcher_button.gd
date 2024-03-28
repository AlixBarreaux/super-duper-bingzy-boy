extends Button
class_name SceneSwitcherButton


@export_file var scene_to_load_file_path: String = ""
@export var scene_to_load_packed_scene: PackedScene = null


func _ready() -> void:
	assert(scene_to_load_file_path != "" or scene_to_load_packed_scene != null, 
	"1 (and only 1) of the 2 \"scene to load\" field must be filled!")
	
	assert(not (scene_to_load_file_path != "" and scene_to_load_packed_scene != null), 
	"1 (and only 1) of the 2 \"scene to load\" field must be filled!")


func _on_pressed() -> void:
	if scene_to_load_file_path != "":
		get_tree().change_scene_to_file(scene_to_load_file_path)
	elif scene_to_load_packed_scene != null:
		get_tree().change_scene_to_packed(scene_to_load_packed_scene)


#func _on_tree_exiting() -> void:
	#get_tree().set_pause(false)
