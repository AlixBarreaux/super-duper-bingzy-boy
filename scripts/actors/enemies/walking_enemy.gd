extends CharacterBody2D
class_name WalkingEnemy


# ----------------- DECLARE VARIABLES -----------------


@export var direction: Vector2 = Vector2(-1.0, 0.0)
@export var move_speed: float = 10.0


@onready var floor_ledge_detector: RayCast2D = $FloorLedgeDetector
@onready var position_left_floor_ledge_detector: Node2D = $PositionLeftFloorLedgeDetector
@onready var position_right_floor_ledge_detector: Node2D = $PositionRightFloorLedgeDetector


var gravity: float = 10.0
var max_fall_speed: float = 350.0
#var gravity_multiplier_factor: float = 8.0


# ----------------- RUN CODE -----------------


func _physics_process(_delta: float) -> void:
	#if not self.is_on_floor():
		#self.apply_gravity()
	
	if ((self.is_on_wall()) or (not floor_ledge_detector.is_colliding())) and self.is_on_floor():
		self.direction *= -1
	

		if self.direction.x == 1:
			floor_ledge_detector.position = position_right_floor_ledge_detector.position

		else:
			floor_ledge_detector.position = position_left_floor_ledge_detector.position

	self.velocity.x = direction.x * self.move_speed
	self.move_and_slide()


# ----------------- DECLARE FUNCTIONS -----------------


#func apply_gravity() -> void:
	#self.velocity.y += self.gravity
	#
	#if self.velocity.y > 0:
		#velocity.y += self.gravity_multiplier_factor
	#
	#if self.velocity.y > self.max_fall_speed:
		#self.velocity.y = self.max_fall_speed
