extends BehaviorTreeNode
class_name Decorator


func _ready():
	if self.get_child_count() != 1:
		print("BehaviorTree Error: Decorator %s should have only one child" % self.name)
