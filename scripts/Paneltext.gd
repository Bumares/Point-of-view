extends Panel

export var dialogpath = ""
export(float) var textspeed = 0.05

var dialog

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = textspeed
	



	


