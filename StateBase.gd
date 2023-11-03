extends Node

class_name StateBase

var stateMachine

func _enter_tree():
	stateMachine = Find.node(self, StateMachine)
	print(stateMachine)

func _state_enter():
	pass

func _state_process(delta):
	pass
	
func _state_physics_process(delta):
	pass
	
func _state_exit():
	pass
	
func _can_transition_to(stateName) -> bool:
	return false
