extends Node2D

var enemy_scene = preload("res://stuff/enemy.tscn")

func spawn_enemy():
	var new_enemy = enemy_scene.instance()
	new_enemy.global_position = global_position
	
	get_parent().add_child(new_enemy)
	
	pass


func _on_Timer_timeout():
	spawn_enemy()
	pass # Replace with function body.
