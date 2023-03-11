extends CharacterBody2D
class_name Player


# ----------------- DECLARE VARIABLES -----------------


var direction: Vector2 = Vector2(1.0, 0.0)


var gravity: float = 10.0
var max_fall_speed: float = 350.0


var max_move_speed: float = 100.0
# Factor to gain gradual move acceleration
var move_acceleration_amount: float = 20.0
# Factor to loose gradual move acceleration
var move_friction_amount: float = 10.0

var gravity_multiplier_factor: float = 8.0
var movement_input: float = 0.0
var friction: float = 0.0

var min_jump_force: float = -50.0
var jump_force: float = -250


# ----------------- RUN CODE -----------------


func _physics_process(_delta: float) -> void:
	if not self.is_on_floor():
		self.apply_gravity()
		
		if Input.is_action_just_released("jump") and velocity.y < self.min_jump_force:
			self.velocity.y = self.min_jump_force
	
	else:
		if Input.is_action_just_pressed("jump"):
			self.velocity.y = self.jump_force
	

	self.movement_input = Input.get_axis("move_left", "move_right")
	self.direction.x = self.movement_input
	
	if self.movement_input == 0:
		self.apply_movement_friction()
	else:
		self.apply_movement_acceleration(self.movement_input)
	

	self.move_and_slide()


func _unhandled_input(_event: InputEvent) -> void:
	return


# ----------------- DECLARE FUNCTIONS -----------------


func apply_gravity() -> void:
	self.velocity.y += self.gravity
	
	if self.velocity.y > 0:
		velocity.y += self.gravity_multiplier_factor
	
	if self.velocity.y > self.max_fall_speed:
		self.velocity.y = self.max_fall_speed


func apply_movement_acceleration(controller_input: float) -> void:
	self.velocity.x = move_toward(self.velocity.x, (self.max_move_speed * controller_input), self.move_acceleration_amount)


func apply_movement_friction() -> void:
	self.velocity.x = move_toward(self.velocity.x, 0, self.move_friction_amount)
