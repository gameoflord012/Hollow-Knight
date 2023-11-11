extends BehaviourNode

@export var waitDuration := 0.0

func _get_behaviour(data) -> BehaviourState:
	var timer := 0.0
	
	while timer + 1 < waitDuration:
		await get_tree().create_timer(1).timeout
		timer += 1
		print("wait ", timer)
	
	await get_tree().create_timer(waitDuration - timer).timeout
	print("wait ", waitDuration, "s")
	
	return BehaviourState.SUCCESS
