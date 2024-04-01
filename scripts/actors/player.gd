extends CharacterBody2D
class_name Player


var id: int = 0

@onready var camera_focus_point: Marker2D = $CameraFocusPoint

var direction: Vector2 = Vector2(1.0, 0.0)


var move_speed: float = 0.0
var max_walk_speed: float = 500.0
var max_run_speed: float = 1000.0
## Factor to gain gradual move acceleration
var move_acceleration_amount: float = 20.0
## Factor to loose gradual move acceleration
var move_friction_amount: float = 300.0

var friction: float = 0.0

var min_jump_force: float = -500.0
var jump_force: float = -2000


var movement_input: Vector2 = Vector2(0.0, 0.0)
var is_secondary_action_pressed: bool = false


func _unhandled_key_input(_event: InputEvent) -> void:
	self.movement_input.x = Input.get_axis("move_left", "move_right")
	is_secondary_action_pressed = Input.is_action_pressed("action_secondary")


func _physics_process(_delta: float) -> void:
	if not self.is_on_floor():
		#self.apply_gravity()
		
		if Input.is_action_just_released("action_primary") and velocity.y < self.min_jump_force:
			self.velocity.y = self.min_jump_force
	else:
		if Input.is_action_just_pressed("action_primary"):
			self.velocity.y = self.jump_force
	
	
	self.direction.x = self.movement_input.x
	
	if self.movement_input.x == 0:
		self.apply_movement_friction()
	else:
		self.apply_movement_acceleration()
	
	self.move_and_slide()


func apply_movement_acceleration() -> void:
	if is_secondary_action_pressed:
		self.move_speed = self.max_run_speed
	else:
		self.move_speed = self.max_walk_speed
	
	self.velocity.x = move_toward(self.velocity.x, (self.move_speed * self.movement_input.x), self.move_acceleration_amount)


func apply_movement_friction() -> void:
	self.velocity.x = move_toward(self.velocity.x, 0, self.move_friction_amount)


signal died(id: int)

func die() -> void:
	died.emit(self.id)
