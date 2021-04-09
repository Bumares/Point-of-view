extends KinematicBody2D

export (int) var run_speed = 200
export (int) var jump_speed = -600
export (int) var gravity = 800
export(int) var upSpeed = 5

var velocity = Vector2()
var jumping = false
var ladder_on = false

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
			
		
		
		if ladder_on == true:
			gravity =0;
			if Input.is_action_pressed("ui_up"):
				velocity.y -= upSpeed
			elif Input.is_action_pressed ("ui_down"):
				velocity.y += upSpeed
		
			else:
				velocity.y = 0
				
		else:
			gravity = 1200
			
		velocity = move_and_slide(velocity, Vector2(0, -1))
		
			 
		
		



	


	









