extends Sprite




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_node("../Door").have_key = 1
		self.visible = false
