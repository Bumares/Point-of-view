extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
