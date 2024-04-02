extends CharacterBody2D
class_name WalkingEnemy


@export var direction: Vector2 = Vector2(0.0, 0.0)
@export var move_speed: float = 0.0


func _ready() -> void:
	assert(direction != Vector2(0.0, 0.0), "Vector can't be set to Vector2(0.0, 0.0) !")
	assert(move_speed > 0.0, "Must be high than 0!")


func _physics_process(_delta: float) -> void:
	self.velocity.x = direction.x * self.move_speed
	self.move_and_slide()
