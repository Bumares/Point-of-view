extends Node2D

func _ready():
	if SoundController.sound_on == false:
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/sound/sound_off.png")
		else:
			$"Button".icon = load("res://sprites/sound/sound_off_wh.png")

func _on_Button_toggled(button_pressed):
	if(button_pressed):
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/sound/sound_off.png")
			SoundController.sound_on = false
		else:
			$"Button".icon = load("res://sprites/sound/sound_off_wh.png")
			SoundController.sound_on = false
	else:
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/sound/sound_on.png")
			SoundController.sound_on = true
		else:
			$"Button".icon = load("res://sprites/sound/sound_on_wh.png")
			SoundController.sound_on = true
	$"Button".release_focus()

