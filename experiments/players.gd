extends Node
class_name Players


signal player_died(id: int)

func on_player_died(id: int) -> void:
	player_died.emit(id)


func _ready() -> void:
	var id_counter: int = 0
	
	for player: Player in self.get_children():
		id_counter += 1
		player.id = id_counter
		player.died.connect(on_player_died)
