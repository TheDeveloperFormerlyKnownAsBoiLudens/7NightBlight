extends ActionLeaf

var player: CharacterBody3D

func before_run(actor: Node, blackboard: Blackboard) -> void:
	actor.set_movement_target(player.global_position)

func tick(actor: Node, blackboard: Blackboard) -> int:
	return SUCCESS