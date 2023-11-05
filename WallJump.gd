extends StateBase

@export var jumpVelocity : Vector2 = Vector2(1000, 1000)
@export var jumpDuration = 0.1

@onready var charBody : CharacterBody2D = stateMachine.characterBody2D
@onready var wallSlide = $"../WallSlide"

var jumpTimer = 0
var wallJumpDirection = 0

func _state_enter():
	wallJumpDirection = -wallSlide.get_wall_axis()
	charBody.velocity.x = wallJumpDirection * jumpVelocity.x
	charBody.velocity.y = -abs(jumpVelocity.y)
	
	jumpTimer = 0
	
func _state_physics_process(delta):
	jumpTimer += delta
	charBody.move_and_slide()
	
func _can_transition_to(state_name) -> bool:
	match state_name:
		"Air":
			return jumpTimer > jumpDuration
		"WallSlide":
			return wallJumpDirection == wallSlide.get_wall_axis()
			
	return false
