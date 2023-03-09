extends CharacterBody2D
class_name Player


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


var direction: Vector2 = Vector2(1.0, 0.0)
var current_speed: float = 80.0

var jump_force: float = -(self.gravity + 220.0)
var gravity: float = 500.0
var max_fall_speed: float = 350.0

func _physics_process(delta: float) -> void:
	if not self.is_on_floor():
		self.velocity.y += gravity * delta
		if self.velocity.y > self.max_fall_speed:
			self.velocity.y = self.max_fall_speed
	
	self.direction.x = Input.get_axis("move_left", "move_right")
	self.velocity.x = self.direction.x * current_speed
	
	if Input.is_action_just_pressed("jump") and self.is_on_floor():
		self.velocity.y = self.jump_force
	print(velocity)
	
	self.move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	return


# ----------------- DECLARE FUNCTIONS -----------------




