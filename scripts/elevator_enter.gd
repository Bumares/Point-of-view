extends Node2D

onready var sprite = get_node("../Player/AnimatedSprite")
onready var player = get_node("../Player")
onready var lightoc =  get_node("../Player/AnimatedSprite/LightOccluder2D")
var vysledek_x = 1
var vysledek_y = 1
var scalee = Vector2(1.55, 1.55)
onready var scale_x = stepify(sprite.scale.x, 0.01)
onready var scale_y = stepify(sprite.scale.y, 0.01)
var inelevator = true
var playerpositionx
var playerpositiony
var setposition = true
var move = true
var move_x
var move_y
var enter_elevator = true

func _ready():
	if inelevator == true:
		player.position.x = global_position.x
		player.position.y = global_position.y
		get_node("../Player").movement = false
		player.onfloor = true
		$AnimatedSprite.play("default")
		player.z_index = 1
		lightoc.visible = false
		player.inelevator = true
		inelevator = false
		sprite.set_scale(scalee)
		get_node("../TileMap2/TileMap").occluder_light_mask = false
		sprite.flip_h = true
		
		if SoundController.sound_on == true:
			$Elevator_sn.play()


func _physics_process(delta):
	if $AnimatedSprite.frame >= 32 and enter_elevator == true:
		player.inelevator = false
		player.z_index = 3
		lightoc.visible = true
		sprite.flip_h = false
		
		
		if setposition == true:
			vysledek_x = abs(stepify(player.position.x, 1)) - 100
			vysledek_y = abs(stepify(player.position.y, 1))
			setposition = false
		
		playerpositionx = abs(stepify(player.position.x, 1))
		playerpositiony = abs(stepify(player.position.y, 1))
		
		move_x = vysledek_x / 10
		move_y = vysledek_y / 10
		
		
		
		if playerpositionx > vysledek_x and move == true:
			player.velocityx = 200
			player.move_and_slide(Vector2(move_x, move_y))
		else:
			get_node("../Player").movement = true
			move = false
			player.onfloor = false
			enter_elevator = false
			$AnimatedSprite/Light2D.visible = false
			

		scale_x = stepify(sprite.scale.x, 0.1)
		scale_y = stepify(sprite.scale.y, 0.1)

		if Vector2(scale_x, scale_y) <= Vector2(1.809, 1.809):
			scalee = scalee + Vector2(+0.005, +0.005)
			player.position.y = player.position.y + 1
			sprite.set_scale(scalee)

