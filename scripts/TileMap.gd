extends TileMap



func _physics_process(delta):
	
	

	if Input.is_action_just_pressed("E") and self.visible == false:
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


func _on_Player_glasses_up(test):
	self.visible = false
	return
