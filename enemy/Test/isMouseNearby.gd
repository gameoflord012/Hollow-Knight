extends ConditionLeaf

@export var detection_radius : float = 300

func tick(actor, blackboard):
	var mouse_pos = get_viewport().get_mouse_position()

	if actor.position.distance_to(mouse_pos) < detection_radius:
		return SUCCESS
		
	return FAILURE
