extends ActionLeaf


func tick(actor, blackboard):
	var mouse_pos = get_viewport().get_mouse_position()
	actor.move_towards_position(mouse_pos, blackboard.b_get("delta"))
	
	if actor.position.distance_to(mouse_pos) < 2:
		return SUCCESS
		
	return RUNNING
