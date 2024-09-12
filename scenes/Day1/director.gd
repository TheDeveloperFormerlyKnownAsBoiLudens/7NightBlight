extends Node

# @onready var user_interface: Control = %UserInterface
@onready var animation_player: AnimationPlayer = %AnimationPlayer

var inventory_dict: Dictionary = {}

func add_to_inventory(item: Node3D) -> void:
	inventory_dict[item.name] = item

func get_from_inventory(key: String) -> Node3D:
	return inventory_dict.get(key)

func game_over() -> void:
	# var time_sprite: Sprite2D = user_interface.get_node("TimerSprite")
	# time_sprite.visible = false
	# var game_over_label: RichTextLabel = user_interface.get_node("GameOverLabel")
	# game_over_label.
	animation_player.play("game_over")
