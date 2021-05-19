extends Node2D

export var state = "0"
signal lever_on(leveron)


func _ready():
	if state == "0":
		$Sprite.flip_h = bool (false)
	else:
		$Sprite.flip_h = bool (true)
		
func _process(_delta):
	if $Area2D.overlaps_body(get_parent().get_node("../Player")) and Input.is_action_just_pressed("lever"):
		emit_signal("lever_on", true)
		if state == "0":
			state = "1"
		else:
			state = "0"
	if state == "0":
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
		
