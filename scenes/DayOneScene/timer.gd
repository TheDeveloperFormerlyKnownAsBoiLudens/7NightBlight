extends Sprite2D

@onready var arm_sprite: Sprite2D = $ArmSprite
@onready var director: Node = %Director

var timer: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# TODO: factor this out to a timer instead or full rotation
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var adjusted_delta: float = delta * 0.1
	arm_sprite.rotate(adjusted_delta)
	timer += adjusted_delta
	if timer >= 32:
		director.game_over()
