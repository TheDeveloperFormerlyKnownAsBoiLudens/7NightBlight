extends Node

var current_scene: Node3D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root: Node = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func change_scene(path: String) -> void:
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path: String) -> void:
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s: Resource = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene

	get_tree().paused = false

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior

# func _input(event) -> void:
# 	if event is InputEventKey:
# 		last_used_input = InputMethod.KEYBOARD
# 	elif event is InputEventJoypadButton:
# 		last_used_input = InputMethod.GAMEPAD
# 	if event.is_action_pressed("ui_cancel"):
# 		if current_scene.name != "MainMenu":
# 			pause_game_flip()
