extends PathFollow2D

var passanger : Node2D


func _process(delta):
	offset += delta * 25
	if unit_offset >= 1:
		print(passanger)
		passanger.global_position = global_position
		get_tree().current_scene.add_child(passanger)
		queue_free()
	pass

