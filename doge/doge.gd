extends CharacterBody3D

@export var movement_speed: float = 2.0
@export var path_desired_distance: float = 0.5
@export var target_desired_distance: float = 3.0

@onready var doge_sprite: Sprite3D = $DogeSprite
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var detection_area: Area3D = $DetectionArea
@onready var alert_sprite: Sprite3D = $AlertSprite
@onready var cart: Node3D = $Cart

var movement_target_position: Vector3
var point_of_interest: Area3D

func _ready() -> void:
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = path_desired_distance
	navigation_agent.target_desired_distance = target_desired_distance

	# Make sure to not await during _ready.
	call_deferred("actor_setup")

func actor_setup() -> void:
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector3) -> void:
	navigation_agent.set_target_position(movement_target)

func _physics_process(_delta: float) -> void:
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	if velocity.x > 0:
		doge_sprite.flip_h = true
	elif velocity.x < 0:
		doge_sprite.flip_h = false
	move_and_slide()

func check_detection_area() -> bool:
	var overlapping_areas: Array[Area3D] = detection_area.get_overlapping_areas()
	var closest_area: Area3D = null
	var closest_distance: float =  1.79769e308
	for area in overlapping_areas:
		var distance: float = self.global_position.distance_to(area.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest_area = area
	point_of_interest = closest_area
	if overlapping_areas.size() >= 1:
		return true
	else:
		return false

func add_to_cart(object: Area3D) -> void:
	object.reparent(cart)