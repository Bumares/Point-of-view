extends Node

const levelselect = preload("res://scenes/main menu/levelselect.tscn")


onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)
	MusicController.level = 0
	MusicController._play_music()

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
		if SoundController.sound_on == true:
			$ButtonSelection_sn.play()
	if Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
		if SoundController.sound_on == true:
			$ButtonSelection_sn.play()
	if Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		if SoundController.sound_on == true:
			$ButtonSelection_sn.play()

func handle_selection(_currnet_selection):
	if current_selection == 0:
		get_tree().change_scene("res://scenes/levels/tutorial.tscn")
		queue_free()
	elif current_selection == 2:
		get_tree().quit()
	elif current_selection == 1:
		get_parent().add_child(levelselect.instance())
		queue_free()







func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
