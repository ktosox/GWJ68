extends Path2D

var cabin_scene = preload("res://world/elevator_cabin.tscn")

func _ready():
	curve.add_point($Enter.position)
	curve.add_point($Exit.position)
	pass

func _on_Enter_body_entered(body): # triggered when enemy reaches the elevator entrance
	if body.is_in_group("Enemy"):
		body.set_elevator_state(true)
		var transport = cabin_scene.instance()
		add_child(transport)
		print(body.get_parent())
		body.get_parent().remove_child(body)

		transport.passanger = body

		pass
	pass # Replace with function body.


func _on_Exit_body_entered(body):
	if body.is_in_group("Enemy"):
		body.set_elevator_state(false)

		pass
	pass # Replace with function body.
