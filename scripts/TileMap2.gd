extends TileMap

func _physics_process(delta):
	
	if Input.is_action_just_pressed("E")&& self.visible == true:
		self.visible = false
		self.occluder_light_mask = false
	else:
		if Input.is_action_just_pressed("ui_left"):
			self.visible = false
			self.occluder_light_mask = false
		if Input.is_action_just_pressed("ui_right"):
			self.visible = false
			self.occluder_light_mask = false
		if Input.is_action_just_pressed("ui_select"):
			self.visible = false
			self.occluder_light_mask = false
		if Input.is_action_just_pressed("ui_down"):
			self.visible = false
			self.occluder_light_mask = false
		if Input.is_action_just_pressed("ui_up"):
			self.visible = false
			self.occluder_light_mask = false





func _on_Player_glasses_up(test):
	self.visible = true
	self.occluder_light_mask = true
	return
