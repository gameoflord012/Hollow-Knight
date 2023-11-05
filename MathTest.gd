extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export var v : float = 165
@export var u : float = 0.5

var s : float = 0

var timer := 0.0
	
func _physics_process(delta):
	s += v * delta
	v = v - u * v * delta
	timer += delta
	
	print("V0 = ", calcVdelta(s, timer, delta, -u))
	print(timer, " ", v, " ", s, " ", delta)
	
func calcVdelta(S, T, delta, u):
	var C = 1 + u * delta
	var vDelta = S / delta * (C - 1) / (pow(C, T / delta + 1) - 1)
	return vDelta
