extends KinematicBody2D


var state_machine 
func _ready():
	self.visible = false
	
func _physics_process(delta):
	if Input.is_action_just_pressed("E")&& self.visible == true:
		self.visible = false
	else:
		if Input.is_action_just_pressed("E")&& self.visible == false:
			self.visible = true
	if Input.is_action_just_pressed("ui_left"):
		self.visible = false
	if Input.is_action_just_pressed("ui_right"):
		self.visible = false
	if Input.is_action_just_pressed("ui_select"):
		self.visible = false
	if Input.is_action_just_pressed("ui_down"):
		self.visible = false
	if Input.is_action_just_pressed("ui_up"):
		self.visible = false
		
		
