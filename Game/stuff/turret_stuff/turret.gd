extends Node2D

# created out of a base + barrel + ammo type

# uses base for battery size + re-charge rate + efficency mod

# barrel 

var battery_max = 100.0

var battery_current = 50.0

var charge_rate = 0.6

var player_charge = 0.0

var efficiency_discount = 0.0

#var speed = 0.0

var damage = 0.0

var cost = 6.0

var cooldown = 0.0

var bonus_range



# enemy tracking stuff

var tracked_enemy = null





func _ready():
	assemble_turret()


var tooltip_scene = preload("res://ui/turret_tooltip.tscn")

func _process(delta):
	battery_current += delta * (charge_rate + player_charge)
	battery_current = min(battery_current, battery_max)
	$BatteryBar.value = battery_current
	if tracked_enemy != null and is_instance_valid(tracked_enemy):
		var offset = tracked_enemy.linear_velocity.x * 0.4
		$Tracker.global_position = tracked_enemy.global_position + Vector2(offset,0)
		$BarrelSlot.look_at($Tracker.global_position)

func assemble_turret():
	# place base
	
	
	# place barrel

	# connect signal from barrel to "shots_fired"
	$BarrelSlot/Barrel.connect("has_fired",self,"shots_fired")
	# get Funcref from barrel for turning it on/off
	pass

func shots_fired():
	battery_current -= cost

	if battery_current < cost:
		$EnergyChecker.start()
		# call Funcref from barrel to turn it off
		$BarrelSlot/Barrel.set_can_shoot(false)
	pass


func update_tracked_enemy():
	var possible_targets = $EnemyDetector.get_overlapping_bodies()
	var chosen_target = null
	if possible_targets.size() != 0:
		chosen_target = possible_targets[0]
	tracked_enemy = chosen_target
	
	
	pass



func _on_EnergyChecker_timeout():
	if battery_current > cost:
		$EnergyChecker.stop()
		# call Funcref from barrel to turn it on
		$BarrelSlot/Barrel.set_can_shoot(true)
	pass # Replace with function body.



func _on_EnemyDetector_body_entered(body):
	if !is_instance_valid(tracked_enemy):
		update_tracked_enemy()
	print(tracked_enemy)
	pass # Replace with function body.


func _on_EnemyDetector_body_exited(body):
	if body == tracked_enemy:
		update_tracked_enemy()
	pass # Replace with function body.


func _on_Clickable_selected(state):
	$TurretTooltip.visible = state
	pass # Replace with function body.


func _on_Clickable_clicked(state):
	if state:
		player_charge = 5.0
	else:
		player_charge = 0.0
	pass # Replace with function body.
