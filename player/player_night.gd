extends Camera3D

const LOOKAROUND_SPEED: float = 0.05

# accumulators
var rot_x: float  = 0
var rot_y: float = 0

var rayOrigin: Vector3 = Vector3()
var rayEnd: Vector3 = Vector3()

@onready var flash_light: SpotLight3D = $Flashlight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	project_ray_origin(


func _physics_process(delta: float) -> void:
	turn()
	mouse_ray()

func turn() -> void:
	# TODO: can this be simplified?
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	rot_x += input_dir.x * LOOKAROUND_SPEED
	transform.basis = Basis() # reset rotation
	rotate_object_local(Vector3(0, -1, 0), rot_x) # first rotate in Y

func mouse_ray() -> void:
	var space_state: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	rayOrigin = project_ray_origin(mouse_position)
	rayEnd = rayOrigin + project_ray_normal(mouse_position) * 2000
	var query: PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd);
	var intersection: Dictionary = space_state.intersect_ray(query)

	flash_light.look_at(rayEnd)
	if not intersection.is_empty():
		var pos: Vector3 = intersection.position
		# flash_light.look_at(pos)
