extends Camera2D


@export var actor_to_follow: Node2D = null
var focus_point: Node2D = null

@export var level_boundaries: LevelBoundaries = null
@onready var level_boundary_left: CollisionShape2D = level_boundaries.boundary_left
@onready var level_boundary_right: CollisionShape2D = level_boundaries.boundary_right


func _ready() -> void:
	assert(actor_to_follow != null, "actor_to_follow must bet set!")
	assert(level_boundaries != null, "level_boundaries must be set!")
	set_physics_process(false)
	
	await actor_to_follow.ready
	focus_point = actor_to_follow.camera_focus_point
	
	self.set_limit(SIDE_LEFT, int(level_boundary_left.get_global_position().x))
	self.set_limit(SIDE_RIGHT, int(level_boundary_right.get_global_position().x))
	set_physics_process(true)


func _physics_process(_delta: float) -> void:
	self.set_global_position(focus_point.get_global_position())
