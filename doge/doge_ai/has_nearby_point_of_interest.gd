extends ConditionLeaf

func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor.check_detection_area() == true:
		actor.alert_sprite.visible = true
		return SUCCESS
	else:
		actor.alert_sprite.visible = false
		return FAILURE


