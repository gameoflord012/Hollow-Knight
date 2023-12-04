extends Node2D

var num_point = 0
var step := 0.5
var astar := AStar2D.new()
	
func find_path(from, to):
	create_new_point(from)
	create_new_point(to)
	
	for point in astar.get_available_point_id():
		print(astar.get_point_position(point))
	
func create_new_point(new_point):
	var cloest_point = astar.get_closest_point(new_point)
	
	if cloest_point < 0 or not \
		is_on_same_grid(astar.get_point_position(cloest_point), new_point):
			astar.add_point(num_point, get_closest_position(new_point))
			num_point += 1
	
func get_grid_position(world_position):
	return Vector2i(round(world_position.x / step), round(world_position.y / step))
	
func is_on_same_grid(position_a, position_b):
	return get_grid_position(position_a) == get_grid_position(position_b)
	
func get_closest_position(world_position):
	return get_grid_position(world_position) * step
