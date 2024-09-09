extends Node3D

func _on_static_body_input_event(camera:Node, event:InputEvent, event_position:Vector3, normal:Vector3, shape_idx:int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("select"):
			print("bark bark")
