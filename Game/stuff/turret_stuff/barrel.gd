extends Node2D

export var spread = 1.0 # 

export var can_shoot = false

signal has_fired

var on_cooldown = false

func set_can_shoot(shoot_state : bool):
	if shoot_state == can_shoot:
		return
	can_shoot = shoot_state
	if can_shoot == true:
		if on_cooldown == false:
			fire()
	pass

func fire():
	# ammo creation code goes here
	on_cooldown = true
	$CooldownTimer.start()
	emit_signal("has_fired")
	pass


func _on_CooldownTimer_timeout():
	on_cooldown = false
	if can_shoot:
		fire()
