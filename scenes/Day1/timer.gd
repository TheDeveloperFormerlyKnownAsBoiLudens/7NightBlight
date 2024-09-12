extends Sprite2D

@onready var arm_sprite: Sprite2D = $ArmSprite

var timer: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arm_sprite.rotate(delta * .2)
	timer += delta
	if timer >= 32:
		GameManager.change_scene("res://scenes/Night1/Night1.tscn")