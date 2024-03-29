extends Node
class_name Stats


@onready var game: Game = get_tree().get_root().get_node("Game")
var level: Level = null
var actors: Node = null
var players: Players = null
var npcs: NPCs = null


signal score_changed
var score: int = 0

func set_score(value: int) -> void:
	score = value
	self.score_changed.emit(value)


signal lives_changed
@export var initial_lives: int = 4
var lives: int = initial_lives
var max_lives: int = 99

func set_lives(value: int) -> void:
	lives = value
	self.lives_changed.emit(value)


func increase_lives(value: int = 1) -> void:
	if lives + value > max_lives: return
	set_lives(lives + value)


func decrease_lives(value: int = 1) -> void:
	var remaining_lives: int = lives - value
	
	if remaining_lives < 0:
		print("No life left!")
		return
	
	set_lives(remaining_lives)


func on_player_died(_id: int) -> void:
	print(self.name, ": Player died!")
	self.decrease_lives()


func _ready() -> void:
	await game.ready
	level = game.level
	actors = level.actors
	players = actors.players
	players.player_died.connect(on_player_died)
