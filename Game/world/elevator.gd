extends Node2D



func _on_Enter_body_entered(body): # triggered when enemy reaches the elevator entrance
	if body.is_in_group("Enemy"):
		body.set_elevator_state(true)
		
		pass
	pass # Replace with function body.


func _on_Exit_body_entered(body):
	if body.is_in_group("Enemy"):
		body.set_elevator_state(false)
		pass
	pass # Replace with function body.
