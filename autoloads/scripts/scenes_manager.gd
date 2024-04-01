extends Node
#class_name ScenesManager


func switch_node_to_scene_file_path(node_to_free: Node, scene_to_switch_to_file_path: String) -> void:
	if node_to_free == get_tree().get_current_scene():
		print("Same scenes, loading with get_tree()!")
		get_tree().change_scene_to_file(scene_to_switch_to_file_path)
		return
	
	print("Not same scenes, loading normally!")
	node_to_free.queue_free()
#
	var scene_to_switch_to: Resource = load(scene_to_switch_to_file_path)
	var scene_to_switch_to_instance: Node = scene_to_switch_to.instantiate()
#
	get_tree().get_root().add_child.call_deferred(scene_to_switch_to_instance)


func switch_node_to_packed_scene(node_to_free: Node, packed_scene: PackedScene) -> void:
	if node_to_free == get_tree().get_current_scene():
		print("Same scenes, loading with get_tree()!")
		get_tree().change_scene_to_packed(packed_scene)
		return
	
	print("Not same scenes, loading normally!")
	node_to_free.queue_free()
#
	#var scene_to_switch_to: int = load(packed_scene)
	#var scene_to_switch_to_instance: Node = scene_to_switch_to.instantiate()
#
	#get_tree().get_root().add_child.call_deferred(scene_to_switch_to_instance)


@export_file var game_file_path: String = ""

func load_level(level_file_path: String) -> void:
	var root_node: Viewport = get_tree().get_root()
	
	var game_scene: Resource = load(game_file_path)
	var game_instance: Game = game_scene.instantiate()
	root_node.add_child.call_deferred(game_instance)
	
	await get_tree().process_frame
	
	var game: Game = root_node.get_node("Game")
	print(self.name, " game node added: ", game)
	
	var scene_to_switch_to: Resource = load(level_file_path)
	var scene_to_switch_to_instance: Level = scene_to_switch_to.instantiate()
	
	game.add_child(scene_to_switch_to_instance)
	#var level: Level = 
	#move_child(, 0)


func _ready() -> void:
	assert(FileAccess.file_exists(game_file_path), "Couldn't find file!")
