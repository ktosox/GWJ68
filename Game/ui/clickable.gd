extends Area2D

signal clicked(state) # true if pressed, false if ended

signal selected(state) # true if mouse in,false if mouse out

var is_pressed = false


func _on_Clickable_mouse_entered():
	emit_signal("selected",true)
	pass # Replace with function body.


func _on_Clickable_mouse_exited():
	emit_signal("selected",false)
	pass # Replace with function body.


func _on_Clickable_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("LMB"):
		is_pressed = true
		emit_signal("clicked",true)
	if event.is_action_released("LMB"):
		is_pressed = false
		emit_signal("clicked",false)
	pass # Replace with function body.
