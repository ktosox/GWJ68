extends Node2D


export var payload : Resource # data of whatever the pick up has

# Called when the node enters the scene tree for the first time.
func _ready():
	set_icon()
	pass # Replace with function body.




func set_icon():
	# extract data from payload
	# use data to set $Icon
	pass




func _on_Clickable_clicked(state):
	if state:
		queue_free()
	pass # Replace with function body.
