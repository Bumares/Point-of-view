extends CanvasLayer

onready var timer = get_node("Timer")
onready var label = $Panel/Label
onready var label2 = $Panel2/Label
onready var label3 = $Panel3/Label
onready var label4 = $Panel4/Label
var text1 = "Hello there, to move yourself use A and D Im sure youll figure it out. Try space for some jumping action"
var text2 = "Spikes, be careful, these might hurt. You maybe noticed that creeper behind you, thats your depresion, her touch is deadly (dont try, trust me). She will be a lot faster in next levels"
var text3 = "Lastly, use E to use pink glasses and see the lever. Q will turn on/off the lever. You wont be able to see spikes and any kinds of traps, so be careful how you use them."
var text4 = "Elevators are your way to acces next levels (main menu is cheating, jk) HAVE FUN"
var precteno1 = false
var precteno2 = false
var precteno3 = false
var precteno4 = false
var value = 0

func _ready():
	timer.set_wait_time(6)
	timer.start()
	text1()

func _process(delta):
	pass

func text1():
	label.text = text1
	if precteno1 == false:
		$Tween.interpolate_property(label,"percent_visible", 0.0, 1.0, 4)
		$Tween.start()
		precteno1 = true
    
		if SoundController.sound_on == true:
			SoundController._play_typing()


func text2():
	label2.text = text2
	if precteno2 == false:
		$Tween.interpolate_property(label2,"percent_visible", 0.0, 1.0, 4)
		$Tween.start()
		precteno2 = true

		if SoundController.sound_on == true:
			SoundController._play_typing()

		
func text3():
	label3.text = text3
	if precteno3 == false:
		$Tween.interpolate_property(label3,"percent_visible", 0.0, 1.0, 4)
		$Tween.start()
		precteno3 = true

		if SoundController.sound_on == true:
			SoundController._play_typing()

func text4():
	label4.text = text4
	if precteno4 == false:
		$Tween.interpolate_property(label4,"percent_visible", 0.0, 1.0, 4)
		$Tween.start()
		precteno4 = true

		if SoundController.sound_on == true:
			SoundController._play_typing()


func _on_Timer_timeout():
	value += 1
	if value == 1:
		text2()
	if value == 2:
		text3()
	if value == 3:
		text4()

