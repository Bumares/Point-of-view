extends KinematicBody2D



func _on_Area2D_body_entered(body):
	if body.get("TYPE")== "player":
		get_tree().reload_current_scene()


func _on_Player_glasses_up(test):
	self.visible = false
	return

