extends BehaviorTreeNode
class_name Leaf

func _ready():
	if self.get_child_count() != 0:
		print("BehaviorTree Error: Leaf %s should not have children" % self.name)
