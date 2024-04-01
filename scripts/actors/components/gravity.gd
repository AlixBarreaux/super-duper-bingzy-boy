extends Node


@export var actor: Node2D = null
@export var gravity: float = 100.0
@export var gravity_multiplier_factor: float = 50.0
@export var max_fall_speed: float = 1500.0

func apply_gravity() -> void:
	actor.velocity.y += self.gravity
	
	if actor.velocity.y > 0:
		actor.velocity.y += self.gravity_multiplier_factor
	
	if actor.velocity.y > self.max_fall_speed:
		actor.velocity.y = self.max_fall_speed


func _ready() -> void:
	if actor == null:
		actor = get_parent()


func _physics_process(_delta: float) -> void:
	if not actor.is_on_floor():
		self.apply_gravity()
