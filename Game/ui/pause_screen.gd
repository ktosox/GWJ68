extends ColorRect

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		visible = !visible
		get_tree().paused = visible
