extends Node2D

export var spread : float

var shell_scene = preload("res://stuff/turret_stuff/ammo/shell.tscn")


func shoot():
	for i in range(5):
		var new_shell = shell_scene.instance()
		new_shell.global_position = global_position
		var speed = 560
		var offset = rand_range(-1,1) * spread
		new_shell.apply_central_impulse(Vector2.RIGHT.rotated(global_rotation + offset ) * speed)
		get_tree().current_scene.add_child(new_shell)
	pass
