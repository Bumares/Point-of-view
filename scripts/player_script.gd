extends KinematicBody2D

export (int) var run_speed = 200
export (int) var jump_speed = -600
export (int) var gravity = 1200
export(int) var upSpeed = 10

var velocity = Vector2()
var jumping = false
var ladder_on = false
var motion = Vector2()
const UP = Vector2(0, -100)

const TYPE = "player"


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
		velocity.x += run_speed
	elif left:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
		velocity.x -= run_speed
	else:
		$AnimatedSprite.play("idle")
	
	
	if is_on_floor() == false:
		$AnimatedSprite.play("jump")



func _physics_process(delta):
		get_input()
		velocity.y += gravity * delta
		if jumping and is_on_floor():
			jumping = false
			
		velocity = move_and_slide(velocity, Vector2(0, -1))
		
		
		if ladder_on == true:
			gravity =0;
			if Input.is_action_pressed("ui_up"):
				motion.y -= upSpeed
			elif Input.is_action_pressed ("ui_down"):
				motion.y += upSpeed
		
			else:
				motion.y = 0
		
		else:
			 gravity = 1200
		
		
		motion = move_and_slide(motion, UP)



	


	








func _on_ladder_body_entered(body):
	pass # Replace with function body.
