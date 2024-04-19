extends Node2D

export var spread = 1.0 # 

export var can_shoot = false

signal has_fired

var bullet_scene = preload("res://stuff/turret_stuff/bullet.tscn")

var on_cooldown = false




func set_can_shoot(shoot_state : bool):
	if shoot_state == can_shoot:
		return
	can_shoot = shoot_state
	fire()
	pass

func fire():
	if can_shoot == false or on_cooldown == true:
		return
	# ammo creation code goes here
	var new_bullet = bullet_scene.instance()
	new_bullet.global_position = $BulletSpawn.global_position
	var speed = 260
	new_bullet.apply_central_impulse(Vector2.RIGHT.rotated(global_rotation) * speed)
	get_tree().current_scene.add_child(new_bullet)
	on_cooldown = true
	$CooldownTimer.start()
	emit_signal("has_fired")
	pass




func _on_CooldownTimer_timeout():
	on_cooldown = false
	fire()


func _on_EnemyDetector_body_entered(body):
	fire()
	pass # Replace with function body.
