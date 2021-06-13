extends Node2D

var icon = MusicController.icon

func _ready():
	if icon == 1:
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/music/music_icon_on.png")
			#MusicController._play_music()
		else:
			$"Button".icon = load("res://sprites/music/music_icon_on_wh.png")
	else:
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/music/music_icon_off.png")
			MusicController._stop_music()
		else:
			$"Button".icon = load("res://sprites/music/music_icon_off_wh.png")
			MusicController._stop_music()
	pass

func _on_Button_pressed():
	#$"AudioStreamPlayer".stream_paused = !$"AudioStreamPlayer".stream_paused
	if icon == 1:
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/music/music_icon_off.png")
		else:
			$"Button".icon = load("res://sprites/music/music_icon_off_wh.png")
		icon = 2
		MusicController.icon = 2
		MusicController._stop_music()
	else:
		if MusicController.level == 0:
			$"Button".icon = load("res://sprites/music/music_icon_on.png")
		else:
			$"Button".icon = load("res://sprites/music/music_icon_on_wh.png")
		icon = 1
		MusicController.icon = 1
		MusicController._play_music()
	$"Button".release_focus()

