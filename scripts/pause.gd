extends CanvasLayer

func _ready():
	set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"): #escape
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
	

func _on_Button_pressed(): #continue
	get_tree().paused = false
	set_visible(false)
	
func _on_Button2_pressed(): #exit
	get_tree().quit()
	set_visible(false)
	
func _on_mainmenu_pressed():
	get_tree().change_scene("res://scenes/main menu/MainMenu.tscn")
	queue_free()


func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible







