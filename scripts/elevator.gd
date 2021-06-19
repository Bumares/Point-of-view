extends Node2D

onready var sprite = get_node("../Player/AnimatedSprite")
onready var player = get_node("../Player")
onready var lightoc =  get_node("../Player/AnimatedSprite/LightOccluder2D")
onready var timer = $Timer
var vysledek_x = 1
var vysledek_y = 1
var scalee = Vector2(1.809, 1.809)
onready var scale_x = stepify(sprite.scale.x, 0.01)
onready var scale_y = stepify(sprite.scale.y, 0.01)
var inelevator = false
export var nextlevl = "res://scenes/levels/tutorial.tscn"



func _on_Area2D_body_entered(body):
	if body.get("TYPE")== "player":
		get_node("../Player").movement = false
		player.onfloor = true
		$AnimatedSprite.play("default")
		$AnimatedSprite/Light2D.visible = true
		inelevator = true
		timer.start()
	


func _physics_process(delta):
	if inelevator == true:
		
		
		vysledek_x = abs(stepify(player.position.x, 1) - stepify(global_position.x, 1))
		vysledek_y = abs(stepify(player.position.y, 1) - stepify(global_position.y, 1))
	
		if (Vector2(vysledek_x, vysledek_y)) >= Vector2(10,10):
			player.move_and_slide(Vector2(vysledek_x, vysledek_y))
		else:
			player.inelevator = true
			sprite.flip_h = true
			player.z_index = 1
			lightoc.visible = false
	
		scale_x = stepify(sprite.scale.x, 0.1)
		scale_y = stepify(sprite.scale.y, 0.1)
	
		if Vector2(scale_x, scale_y) >= Vector2(1.55, 1.55):
			scalee = scalee + Vector2(-0.005, -0.005)
			player.position.y = player.position.y - 1
			sprite.set_scale(scalee)
			
		if SoundController.sound_on == true:
			$Elevator_sn.play()

func _ready():
	timer.set_wait_time(7)


func _on_Timer_timeout():
	if inelevator == true:
		get_tree().change_scene(nextlevl)
		queue_free()
