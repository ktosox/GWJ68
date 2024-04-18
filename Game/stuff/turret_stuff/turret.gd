extends Node2D

# created out of a base + barrel + ammo type

# uses base for battery size + re-charge rate + efficency mod

# barrel 

var battery_max = 100.0

var battery_current = 0.0

var charge_rate = 0.5 

var efficiency_discount = 0.0

#var speed = 0.0

var damage = 0.0

var cost = 0.0

var cooldown = 0.0

var bonus_range

# enemy tracking stuff

var tracked_enemy = null


var tooltip_scene = preload("res://ui/turret_tooltip.tscn")

func _process(delta):
	battery_current += delta * charge_rate
	battery_current = min(battery_current, battery_max)
	if tracked_enemy != null:
		$Tracker.global_position = tracked_enemy.global_position
		$BarrelSlot.look_at($Tracker.global_position)

func assemble_turret():
	# place base
	# place barrel
	# connect signal from barrel to "shots_fired"
	# get Funcref from barrel for turning it on/off
	pass

func shots_fired():
	battery_current -= cost
	if battery_current < cost:
		$EnergyChecker.start()
		# call Funcref from barrel to turn it off
	pass


func update_tracker():
	var possible_targets = $EnemyDetector.get_overlapping_bodies()
	if possible_targets.size() == 0:
		tracked_enemy = null
		return
	tracked_enemy = possible_targets[0]
	pass



func _on_EnergyChecker_timeout():
	if battery_current > cost:
		$EnergyChecker.stop()
		# call Funcref from barrel to turn it on
	pass # Replace with function body.


func _on_HoverBox_mouse_entered():
	$TurretTooltip.visible = true
	pass # Replace with function body.


func _on_HoverBox_mouse_exited():
	$TurretTooltip.visible = false
	pass # Replace with function body.



func _on_EnemyDetector_body_entered(body):
	if tracked_enemy == null:
		update_tracker()
	pass # Replace with function body.


func _on_EnemyDetector_body_exited(body):
	if body == tracked_enemy:
		tracked_enemy = null
		update_tracker()
	pass # Replace with function body.
