extends Node2D


func _physics_process(delta):
	
	if Input.is_action_just_pressed("E")&& self.visible == true:
		self.visible = false
	else:
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






func _on_Player_glasses_up(test):
	self.visible = true
	return
