extends BehaviourNode

func _get_behaviour(data) -> BehaviourState:
	for child in get_child_behaviour():
		if not await child.process_behaviour(data):
			return BehaviourState.FAILED
	
	return BehaviourState.SUCCESS
