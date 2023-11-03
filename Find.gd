class_name Find

static func node(source : Node, type):
	var s = source
	while(s):
		if is_instance_of(s, type):
			return s
			
		s = s.get_parent()
	return null
		
