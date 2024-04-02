extends Node2D
class_name ActorMovementNoLedgeFall


@export var actor: Node2D = null

@onready var floor_ledge_detector: RayCast2D = $FloorLedgeDetector
@onready var position_left_floor_ledge_detector: Node2D = $PositionLeftFloorLedgeDetector
@onready var position_right_floor_ledge_detector: Node2D = $PositionRightFloorLedgeDetector


#func on_actor_direction_set(value: Vector2) -> void:
	#if (not floor_ledge_detector.is_colliding()) and actor.is_on_floor():
		#if actor.direction.x == 1:
			#floor_ledge_detector.position = position_right_floor_ledge_detector.position
			#actor.direction *= -1
		#elif actor.direction.x == -1:
			#floor_ledge_detector.position = position_left_floor_ledge_detector.position
			#actor.direction *= -1


func _ready() -> void:
	if actor == null:
		actor = self.get_parent()
	
	#actor.direction_set.connect(on_actor_direction_set)
	
	print(self.name, ": Ready direction: ", actor.direction)
	
	if actor.direction.x == 1:
		floor_ledge_detector.position = position_right_floor_ledge_detector.position
		#actor.direction *= -1
	elif actor.direction.x == -1:
		floor_ledge_detector.position = position_left_floor_ledge_detector.position
		#actor.direction *= -1


func _physics_process(_delta: float) -> void:
	if not self.floor_ledge_detector.is_colliding() and actor.is_on_floor():
		if actor.direction.x == -1 or actor.direction.x == 1:
			actor.direction *= -1
	
	if actor.direction.x == 1:
		self.floor_ledge_detector.position = position_right_floor_ledge_detector.position
	else:
		self.floor_ledge_detector.position = position_left_floor_ledge_detector.position
	
	
