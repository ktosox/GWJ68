extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Clickable_selected(state):
	if state:
		color = ColorN("yellow")
	else:
		color = ColorN("white")
	pass # Replace with function body.


func _on_Clickable_clicked(state):
	if state:
		color = ColorN("red")
	else:
		color = ColorN("yellow")
	pass # Replace with function body.
