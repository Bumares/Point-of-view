extends CanvasLayer

onready var timer = get_node("Timer")
onready var labelone = $Node2D/CanvasLayer/Panel/Label
onready var labeltwo = $Node2D/CanvasLayer/Panel2/Label
onready var labelthree = $Node2D/CanvasLayer/Panel3/Label
onready var labelfour = $Node2D/CanvasLayer/Panel4/Label
var randomstringtext = "jablko za 10 sec"

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(2)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	labelone = randomstringtext
