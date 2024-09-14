extends Node3D

var is_collected: bool = false

func _on_body_entered(body:Node3D) -> void:
	if is_collected:
		return
	body.enable_context_label()


func _on_body_exited(body:Node3D) -> void:
	if is_collected:
		return
	body.disable_context_label()
