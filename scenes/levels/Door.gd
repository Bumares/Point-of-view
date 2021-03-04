extends StaticBody2D

var have_key = 0
var in_door = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_door = true
			
func _physics_process(delta):
	if in_door:
		if Input.is_action_just_pressed("lever"):
			if have_key == 1:
				get_node("CollisionShape2D").disabled = true
				

