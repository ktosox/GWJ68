extends Node2D

export var active = false

var enemy_scene = preload("res://stuff/enemy.tscn")

func spawn_enemy():
	var new_enemy = enemy_scene.instance()
	new_enemy.global_position = global_position
	
	get_parent().add_child(new_enemy)
	
	pass

func set_active(state : bool):
	active = state
	if active:
		$Dot.modulate = ColorN("red")
	else:
		$Dot.modulate = ColorN("black")

func _on_Timer_timeout():
	if active:
		spawn_enemy()
	pass # Replace with function body.
