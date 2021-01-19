extends KinematicBody2D

func _physics_process(delta):
	if Input.is_action_just_pressed("E")&& self.visible == true:
		self.visible = false
	else:
		if Input.is_action_just_pressed("E")&& self.visible == false:
			self.visible = true




func _on_Area2D_body_entered(body):
	if body.get("TYPE")== "player":
		get_tree().reload_current_scene()
	
	

