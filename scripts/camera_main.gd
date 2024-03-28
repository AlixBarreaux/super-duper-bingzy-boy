extends Camera2D


@export var actor_to_follow: Node2D = null
@onready var focus_point: Node2D = actor_to_follow.camera_focus_point

@export var level_boundaries: LevelBoundaries = null
@onready var level_boundary_left: CollisionShape2D = level_boundaries.boundary_left
@onready var level_boundary_right: CollisionShape2D = level_boundaries.boundary_right


func _ready() -> void:
	assert(actor_to_follow != null)
	assert(level_boundaries != null)
	
	self.set_limit(SIDE_LEFT, level_boundary_left.get_global_position().x)
	self.set_limit(SIDE_RIGHT, level_boundary_right.get_global_position().x)


func _physics_process(_delta: float) -> void:
	self.set_global_position(focus_point.get_global_position())