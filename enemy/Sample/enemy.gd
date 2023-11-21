extends CharacterBody2D

var move_direction : Vector2 = Vector2(1, 1)

func _physics_process(delta):
	self.velocity.y = 500
	
	move_and_slide()

func move_with_speed(speed):
	self.velocity.x = move_direction.x * speed
	
func move_towards_position(target_position: Vector2, delta: float):
	self.position += self.position.direction_to(target_position) * delta * 100
 
func move_horizontal_direction(direction_x: int, delta: float):
	self.position.x += direction_x * delta * 100
 
