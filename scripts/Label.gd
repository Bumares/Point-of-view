extends Label

onready var timer = get_node("Timer")
var textos = "Hello there, to move yourself use A and D Im sure youll figure it out Space for some jumping action"
export(float) var textspeed = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
