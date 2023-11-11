extends BehaviourNode

@export var repeat_count : int = 1

func _get_behaviour(data) -> BehaviourState:
	var count = 0
	
	while count != repeat_count:
		for child in get_child_behaviour():
			if not await child.process_behaviour(data):
				return BehaviourState.FAILED
		
		return BehaviourState.PROCESS_CLOSET
		
		count+=1
		
	return BehaviourState.SUCCESS
