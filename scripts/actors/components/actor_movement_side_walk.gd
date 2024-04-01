extends Node
class_name ActorMovementSideWalk


@export var actor: Node2D = null


func _ready() -> void:
	if actor == null:
		actor = self.get_parent()

func _physics_process(_delta: float) -> void:
	if actor.is_on_wall():
		actor.direction *= -1
