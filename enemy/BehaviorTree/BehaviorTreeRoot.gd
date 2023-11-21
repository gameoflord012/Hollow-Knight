extends BehaviorTree

class_name BehaviorTreeRoot

const Blackboard = preload("./Blackboard.gd")

@export var enabled : bool = true

@onready var blackboard = Blackboard.new()

func _ready():
	if self.get_child_count() != 1:
		print("Behavior Tree error: Root should have one child")
		disable()
		return
		
	var player = get_tree().get_first_node_in_group("Player")
	blackboard.b_set("player", player)

func _physics_process(delta):
	if not enabled:
		return

	blackboard.b_set("delta", delta)

	self.get_child(0).tick(get_parent(), blackboard)


func enable():
	self.enabled = true


func disable():
	self.enabled = false
