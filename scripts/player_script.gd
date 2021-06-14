extends KinematicBody2D

export (int) var run_speed = 400
export (int) var jump_speed = -800
export (int) var gravity = 800
export(int) var upSpeed = 50
var velocity = Vector2()
var jumping = false
var ladder_on = false
var base_run_speed = run_speed
var base_jump_speed = jump_speed
var animation 
var animation_playing = "idle"
var velocityx = 0
var glasses = false
var glasses_on = false
var glasses_down = false
signal glasses_up(test)
var func1 = true
var func2 = true
var movement = true
var onfloor = false
var inelevator = false


const TYPE = "player"

#INPUT DETECTION
func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')
	
	if glasses == false and Input.is_action_just_pressed("E") and !right and !left and is_on_floor():
		movement = false
		glasses = true

		if SoundController.sound_on == true:
			$GlassesOn_sn.play()

	
	if (glasses == true and Input.is_action_just_pressed("E") and glasses_on == true) or ((left or right or jump) and glasses == true):
		glasses_down = true
		func1 = true

		if SoundController.sound_on == true:
			$GlassesOff_sn.play()
		movement = false

	
	if movement == true:
		if jump and is_on_floor():
			jumping = true
			velocity.y = jump_speed
			if SoundController.sound_on == true:
				$Jump_sn.play()
		if right:
			velocity.x += run_speed
		elif left:
			velocity.x -= run_speed
	
	if SoundController.sound_on == true:
		if velocity.x != 0 and is_on_floor():
			if !$Run_sn.playing:
				$Run_sn.play()
		elif $Run_sn.playing:
				$Run_sn.stop()
		
	


#ANIMATION SELECTION
func animation_play():
	if (is_on_floor() == true and velocity.x == 0 and glasses == false) or inelevator == true:
		animation_playing = "idle"
		
	if (is_on_floor() == true or onfloor == true) and velocityx > 0 and glasses == false and inelevator == false:
			animation_playing = "run"
			$AnimatedSprite.flip_h = false
			
			
			
	if is_on_floor() == true and velocityx < 0 and glasses == false and inelevator == false:
			animation_playing = "run"
			$AnimatedSprite.flip_h = true
			
	if is_on_floor() == false and velocityx < 0 and glasses == false and onfloor == false:
		animation_playing = "jump"
		$AnimatedSprite.flip_h = true
	
	if is_on_floor() == false and velocityx >= 0 and glasses == false and onfloor == false:
		animation_playing = "jump"
		$AnimatedSprite.flip_h = false
	
	if is_on_floor() == true and velocityx == 0 and glasses == true and glasses_down == false:
		animation_playing = "glasses_up"
		if func1 == true:
			$AnimatedSprite.connect('animation_finished', self, '_on_animation_finished')
			func1 = false
	
	if is_on_floor() == true and velocityx == 0 and glasses == true and glasses_down == true:
		animation_playing = "glasses_down"
		if func2 == true:
			$AnimatedSprite.connect('animation_finished', self, '_on_glasses_finished')
			func2 = false
	
	$AnimatedSprite.play(animation_playing)
	


#GLASSES RELATED FUNCTION
func _on_animation_finished():
	if $AnimatedSprite.frame == 10 and glasses == true and glasses_on == false:
		glasses_on = true
		movement = true
		emit_signal("glasses_up", true)
	return

#GLASSES RELATED FUNCTION
func _on_glasses_finished():
	if $AnimatedSprite.frame == 10 and glasses_down == true:
		glasses_on = false
		glasses_down = false
		glasses = false
		func2 = true
		movement = true
	return



func _physics_process(delta):
		get_input()
		animation_play()
		velocity.y += gravity * delta
		if glasses_on == true:
			run_speed = 0
			jump_speed = 0
		if glasses_down == true:
			run_speed = base_run_speed
			jump_speed = base_jump_speed
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
		
		velocityx = velocity.x
		 
		for i in get_slide_count():
				var collision = get_slide_collision(i)
				if collision.collider.has_method("collide_with"):
					collision.collider.collide_with(collision, self
					   )
