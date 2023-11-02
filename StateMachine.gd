extends Node

class_name StateMachine

@export var default_state_name = "None"

var currentState : StateBase
var stateDict := {}

func _ready():
	for child in get_children():
		if child is StateBase:
			stateDict[child.name] = child
			child.stateMachine = self
	
	change_to_state(default_state_name)
	
func _physics_process(delta):
	if currentState:
		currentState._state_physics_process(delta)
		
	process_transition()
		
func _process(delta):
	if currentState:
		currentState._state_process(delta)
		
	process_transition()
		
func process_transition():
	for state_name in stateDict.keys():
		if can_transition_to(state_name):
			change_to_state(state_name)
			return
		
func can_transition_to(state_name) -> bool:
	if currentState:
		return currentState._can_transition_to(state_name)
	else:
		return false

func change_to_state(state_name):
	if stateDict.has(state_name):
		if currentState:
			currentState._state_exit()
			
		currentState = stateDict[state_name]
		currentState._state_enter()
	else:
		assert(false, "State %s doesn't exist" % [state_name])
