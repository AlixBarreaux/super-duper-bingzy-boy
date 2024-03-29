extends HBoxContainer
class_name LivesCounterUI


@onready var game: Game = get_tree().get_root().get_node("Game")
var level: Level = null
var stats: Stats = null
@onready var label: Label = $Label


func on_lives_changed(value: int) -> void:
	self.label.set_text("x " + str(value))


func _ready() -> void:
	await get_tree().get_root().ready
	level = game.level
	stats = game.stats
	
	self.label.set_text("x " + str(stats.lives))
	stats.lives_changed.connect(on_lives_changed)
