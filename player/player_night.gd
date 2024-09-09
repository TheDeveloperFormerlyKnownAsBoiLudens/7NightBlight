extends Camera3D

const LOOKAROUND_SPEED: float = 0.05

# accumulators
var rot_x: float  = 0
var rot_y: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Vector3.FORWARD)
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	# TODO: can this be simplified?
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	rot_x += input_dir.x * LOOKAROUND_SPEED
	transform.basis = Basis() # reset rotation
	rotate_object_local(Vector3(0, -1, 0), rot_x) # first rotate in Y