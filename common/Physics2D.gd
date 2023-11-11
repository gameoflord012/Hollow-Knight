class_name Physics2D

static func linecast(node : Node, from : Vector2, to : Vector2, collision_mask: int = 0xFFFFFFFF, exclude: Array[RID] = []) -> Dictionary:
	var space_state = node.get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(from, to, collision_mask, exclude)
	return space_state.intersect_ray(query)
