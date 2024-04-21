extends Node2D

export var spread : float

export var damage : int

func shoot():
	$Flash/AnimationPlayer.play("New Anim")
	$Detector.rotation = rand_range(-0.4,0.4) * spread
	if !$Detector.is_colliding():
		return
	$Detector.get_collider().get_hit(damage)
	pass
