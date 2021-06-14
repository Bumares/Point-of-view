extends MarginContainer



var current_selection = 0

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer4/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_four = $CenterContainer/VBoxContainer/CenterContainer5/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_five = $CenterContainer/VBoxContainer/CenterContainer6/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_six = $CenterContainer/VBoxContainer/CenterContainer7/VBoxContainer/CenterContainer/HBoxContainer/Selector

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 5:
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
	if current_selection == 5:
		get_tree().change_scene("res://scenes/main menu/MainMenu.tscn")
		queue_free()
	if current_selection == 0:

		get_tree().change_scene("res://scenes/levels/level1A.tscn")
		queue_free()
	if current_selection == 1:
		get_tree().change_scene("res://scenes/levels/Level2.tscn")
		queue_free()
	if current_selection == 2:
		get_tree().change_scene("res://scenes/levels/Level3.tscn")
		queue_free()
	if current_selection == 3:
		get_tree().change_scene("res://scenes/levels/Level4.tscn")
		queue_free()
	if current_selection == 4:
		get_tree().change_scene("res://scenes/levels/tutorial.tscn")
		queue_free()



func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	selector_four.text = ""
	selector_five.text = ""
	selector_six.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
	elif _current_selection == 3:
		selector_four.text = ">"
	elif _current_selection == 4:
		selector_five.text = ">"
	elif _current_selection == 5:
		selector_six.text = ">"
