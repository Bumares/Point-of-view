extends KinematicBody2D

#VARIABLES
var velocity = Vector2()

export (int) var speed_x = 50
export (int) var speed_y = 50

var direction

var poloha_x = 1 
var poloha_y =1

var timer = null
var wait = false
export (int) var delay = 2

#TARGETING SYSTEM
func _physics_process(delta):
	
	
	if Input.is_action_just_pressed("E")&& self.visible == true:
		self.visible = false
	else:
		if Input.is_action_just_pressed("E")&& self.visible == false:
			self.visible = true
			
	
	
	var player = $"../Player"

	if (Vector2(stepify(position.x, 1), stepify(position.y, 1))) == (Vector2(stepify(poloha_x, 1), stepify(poloha_y, 1))) or direction == null:
		timer.start()
		wait = true
		direction = global_position.direction_to(player.global_position)
		poloha_x = player.position.x
		poloha_y = player.position.y
		
		
	
	#MOVEMENT SYSTEM
	if wait == false:
		velocity = velocity.move_toward(direction * speed_x, speed_y)
		move_and_slide(velocity)
	
	
#TIMER
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
func on_timeout_complete():
	wait = false
	
	
	
	
	
	
	
	



func _on_Area2D_body_entered(body):
	if body.get("TYPE")== "player":
		 get_tree().reload_current_scene()
