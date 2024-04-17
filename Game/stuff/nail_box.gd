extends RigidBody2D

var nail_scene = preload("res://stuff/nail.tscn")

var fall_time = 0


func _process(delta):
	fall_time += delta * 1.4

func spawn_nails():
	var count = 5
	var angle = -0.4
	while count > 0:
		var new_nail = nail_scene.instance()
		new_nail.global_position = global_position
		new_nail.rotation = angle
		new_nail.apply_central_impulse(Vector2(0,-50).rotated(angle) * fall_time)
		get_parent().add_child(new_nail)
		count -= 1
		angle += 0.2
	pass

func _on_NailBox_body_entered(body):
	spawn_nails()
	queue_free()
	pass # Replace with function body.
