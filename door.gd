extends Area2D



func _on_door_body_entered(body):
	if body.get("TYPE")== "player":
		get_tree().change_scene("res://scenes/levels/level1.tscn")
