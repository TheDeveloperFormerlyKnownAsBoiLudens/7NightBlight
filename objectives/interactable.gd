extends Node3D

var is_collected: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body:Node3D) -> void:
	if is_collected:
		return
	body.enable_context_label()


func _on_body_exited(body:Node3D) -> void:
	if is_collected:
		return
	body.disable_context_label()
