extends BehaviorTreeNode
class_name Composite

func _ready():
	if self.get_child_count() < 1:
		print("BehaviorTree error: Composite %s should have at least 1 child" % self.name)
