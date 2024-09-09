extends ActionLeaf

var point_of_interest: Area3D

func before_run(actor: Node, blackboard: Blackboard) -> void:
	point_of_interest = actor.point_of_interest
	actor.set_movement_target(point_of_interest.global_position)

func tick(actor: Node, blackboard: Blackboard) -> int:
	return SUCCESS