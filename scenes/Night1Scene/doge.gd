extends Node3D

@onready var dialog_label: RichTextLabel = %DialogLabel

var selected_text: String = '[center]Ruff McSparks is resting[/center]'

func _on_static_body_input_event(camera:Node, event:InputEvent, event_position:Vector3, normal:Vector3, shape_idx:int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("select"):
			dialog_label.text = selected_text
