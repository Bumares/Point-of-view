extends Node2D

func _ready():
	MusicController.level = 2
	MusicController._stop_music()
	MusicController._play_music()

