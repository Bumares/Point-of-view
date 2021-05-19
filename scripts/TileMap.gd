extends TileMap



func _physics_process(delta):
	
	

	if Input.is_action_just_pressed("E") and self.visible == false:
			self.visible = true
			self.occluder_light_mask = true
	if Input.is_action_just_pressed("ui_left"):
		self.visible = true
		self.occluder_light_mask = true
	if Input.is_action_just_pressed("ui_right"):
		self.visible = true
		self.occluder_light_mask = true
	if Input.is_action_just_pressed("ui_select"):
		self.visible = true
		self.occluder_light_mask = true
	if Input.is_action_just_pressed("ui_down"):
		self.visible = true
		self.occluder_light_mask = true
	if Input.is_action_just_pressed("ui_up"):
		self.visible = true
		self.occluder_light_mask = true


func _on_Player_glasses_up(test):
	self.visible = false
	self.occluder_light_mask = false
	return
