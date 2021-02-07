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
var locktarget = false


func _physics_process(delta):
	
	#VIEW SYSTEM
	if Input.is_action_just_pressed("E")&& self.visible == true:
		self.visible = false
	else:
		if Input.is_action_just_pressed("E")&& self.visible == false:
			self.visible = true
	if Input.is_action_just_pressed("ui_left"):
		self.visible = true
	if Input.is_action_just_pressed("ui_right"):
		self.visible = true
	if Input.is_action_just_pressed("ui_select"):
		self.visible = true
	if Input.is_action_just_pressed("ui_down"):
		self.visible = true
	if Input.is_action_just_pressed("ui_up"):
		self.visible = true
	
	
	#TARGETING SYSTEM
	var player = $"../Player"

	if abs(stepify(position.x, 1) - stepify(poloha_x, 1)) <= 1 and abs(stepify(position.y, 1) - stepify(poloha_y, 1)) <= 1 or direction == null:
		timer.start()
		wait = true
		direction = global_position.direction_to(player.global_position)
		poloha_x = player.position.x
		poloha_y = player.position.y
	
	
	
	if locktarget == true:
		direction = global_position.direction_to(player.global_position)
		poloha_x = player.position.x
		poloha_y = player.position.y
		locktarget = false
	
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
	locktarget = true
	


func _on_Area2D_body_entered(body):
	if body.get("TYPE")== "player":
		 get_tree().reload_current_scene()
