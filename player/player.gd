extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var context_label: Label3D = $Label3D
@onready var interact_area: Area3D = $InteractArea
@onready var inventory: Node = $Inventory
@onready var doge: CharacterBody3D = %Doge

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func enable_context_label() -> void:
	context_label.set_visible(true)

func disable_context_label() -> void:
	context_label.set_visible(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var overlapping_areas: Array[Area3D] = interact_area.get_overlapping_areas()
		if overlapping_areas.size() == 0:
			return
		var closest_area: Area3D = null
		var closest_distance: float =  1.79769e308
		for area in overlapping_areas:
			var distance: float = self.global_position.distance_to(area.global_position)
			if distance < closest_distance:
				closest_distance = distance
				closest_area = area
		
		closest_area.monitorable = false
		doge.add_to_cart(closest_area)