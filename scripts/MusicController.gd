extends Node2D

var icon = 1
var level = 0

func _ready():
	pass
	
func _play_music():
	if level == 0:
		$Theme_sn.play()
	if level == 1:
		$CityNoise_sn.play()
	if level == 2:
		$Music1_sn.play()
	
func _stop_music():
	$Theme_sn.stop()
	$CityNoise_sn.stop()
	$Music1_sn.stop()
