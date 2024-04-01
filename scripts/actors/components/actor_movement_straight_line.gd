extends Node
class_name ActorMovementStraightLine


@export var actor: Node2D = null

@export var direction: Vector2 = Vector2(0.0, 0.0)
@export var move_speed: float = 0.0


func _ready() -> void:
	assert(direction != Vector2(0.0, 0.0), "Must not be Vector2(0.0, 0.0)")
	assert(move_speed > 0.0, "Must be more than 0!")
	
	if actor == null:
		actor = self.get_parent()


func _physics_process(delta: float) -> void:
	var velocity: Vector2 = Vector2(0.0, 0.0)
	velocity = self.direction * self.move_speed
	actor.global_position += velocity * delta
