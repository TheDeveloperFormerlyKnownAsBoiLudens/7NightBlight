extends Node3D

@onready var game_over_player: AnimationPlayer = %GameOverPlayer

var enemies: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemies = get_tree().get_nodes_in_group("enemies")
	for enemy: Node3D in enemies:
		enemy.tree_exited.connect(_check_game_over)
	
func _check_game_over() -> void:
	enemies = get_tree().get_nodes_in_group("enemies")
	
	if enemies.size() <= 0:
		$GameOverTimer.stop()
		game_over_player.play("game_win")

func _on_game_over_timer_timeout() -> void:
	game_over_player.play("game_over_2")
