extends Node2D


export var state = "0"

func _ready():
	self.visible = false
	if state == "0":
		$Sprite.flip_h = bool (false)
	else:
		$Sprite.flip_h = bool (true)
		
func _process(delta):
	if $Area2D.overlaps_body($"../Player") and Input.is_action_just_pressed("lever"):
		if state == "0":
			state = "1"
		else:
			state = "0"
	if state == "0":
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
		
		
		


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
