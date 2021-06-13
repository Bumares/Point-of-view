extends KinematicBody2D

export var move_speed = 2.0
export var move_distance = 50.0
export var move_direction = Vector2(1,1)
var time_since_init = 0.0
var origin = Vector2(0,0)
var lever = false


func _ready():
	time_since_init = 0.0
	origin = position


func _physics_process(delta):
	if lever == true:
		time_since_init = time_since_init + delta
		var position_on_curve = sin(time_since_init * PI * move_speed)
		var offset = move_distance * position_on_curve * move_direction
		position = origin + offset


func _on_lever_lever_on(leveron):
	if lever == false:
		lever = true
	else:
		 lever = false
	
	
	



