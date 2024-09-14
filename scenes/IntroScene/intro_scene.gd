extends Node3D

@export var scene_path: Resource

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ENTER:
			GameManager.change_scene(scene_path.resource_path)