extends Node2D

export var can_shoot = false

signal has_fired

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
	if $EnemyDetector.get_overlapping_bodies().size() == 0:
		return
	# ammo creation code goes here
	$BulletSpawn.get_child(0).shoot()
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
