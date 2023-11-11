extends Node2D

class_name BehaviourNode

enum BehaviourState { FAILED, SUCCESS, PROCESS, PROCESS_PHYSICS, PROCESS_CLOSET }

signal on_process_completed(process_result)
signal on_closet_process

@export var _start_on_ready := false

var _is_processing := false
var _last_process_result := false

func _init():
	on_process_completed.connect(_process_compledted_handler)

func _ready():
	get_tree().physics_frame.connect(func() : on_closet_process.emit())
	get_tree().process_frame.connect(func() : on_closet_process.emit())
	
	if _start_on_ready:
		await process_behaviour({})

func _before_process(data):
	pass
	
func _get_behaviour(data) -> BehaviourState:
	return BehaviourState.SUCCESS
	
func _after_process(data):
	pass
	
func get_child_behaviour() -> Array:
	return get_children().filter(\
		func(node): return node is BehaviourNode)
		
func process_behaviour(data) -> bool:
	if _is_processing:
		await on_process_completed
	else:
		_before_process(data)
		_is_processing = true
		
		var process_state
		while true:
			process_state = await _get_behaviour(data)
			
			match process_state:
				BehaviourState.PROCESS:
					await get_tree().process_frame
				BehaviourState.PROCESS_PHYSICS:
					await get_tree().physics_frame
				BehaviourState.PROCESS_CLOSET:
					await on_closet_process
				_: break
		
		on_process_completed.emit(process_state == BehaviourState.SUCCESS)
		_is_processing = false
		_after_process(data)
	
	return _last_process_result
	
func _process_compledted_handler(process_result):
	_last_process_result = process_result
	
