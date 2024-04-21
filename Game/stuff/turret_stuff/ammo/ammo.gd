extends Node2D

export var spread : float

export var damage : int

var bullet_scene = preload("res://stuff/turret_stuff/ammo/bullet.tscn")

func shoot():
	var new_bullet = bullet_scene.instance()
	new_bullet.global_position = global_position
	new_bullet.damage = damage
	var speed = 560
	var offset = rand_range(-1,1) * spread
	new_bullet.apply_central_impulse(Vector2.RIGHT.rotated(global_rotation + offset ) * speed)
	get_tree().current_scene.add_child(new_bullet)
	pass
