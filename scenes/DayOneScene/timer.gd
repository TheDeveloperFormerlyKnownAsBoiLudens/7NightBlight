extends Sprite2D

@export var next_scene: Resource

@onready var arm_sprite: Sprite2D = $ArmSprite
@onready var director: Node = %Director

var timer: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# TODO: factor this out to a timer instead or full rotation
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arm_sprite.rotate(delta * .2)
	timer += delta
	if timer >= 32:
		if director.get_from_inventory("Tent"):
			GameManager.change_scene(next_scene.resource_path)
		else:
			director.game_over()