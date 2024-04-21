extends Node2D

# created out of a base + barrel + ammo type

# uses base for battery size + re-charge rate + efficency mod

export var turret_data : Resource

# barrel 

var battery_max = 100.0

var battery_current = 50.0

var charge_rate = 1.0

var bonus_charge = 0 # applied when player holds LMB

var player_charge = 8.0 # how much to speed up thanks to player

var cost = 6.0

var bonus_range



# enemy tracking stuff

var tracked_enemy = null

var targeting_offfset = 0.4



func _ready():
	assemble_turret()


#var tooltip_scene = preload("res://ui/turret_tooltip.tscn")

func _process(delta):
	battery_current += delta * (charge_rate + (player_charge * bonus_charge))
	battery_current = min(battery_current, battery_max)
	$BatteryBar.value = battery_current
	if tracked_enemy != null and is_instance_valid(tracked_enemy):
		$Tracker.global_position = tracked_enemy.global_position + Vector2(tracked_enemy.linear_velocity.x * targeting_offfset,0)
		$BarrelSlot.look_at($Tracker.global_position)

func assemble_turret():
	print("assembling turret: ",turret_data.value)
	# set values from data
	
	# for base
	battery_max = turret_data.value["battery"]
	charge_rate = turret_data.value["recharge"]
	cost = turret_data.value["cost"]
	$EnemyDetector/CollisionShape2D.shape.radius = turret_data.value["range"]
	
	# for barrel
	$BarrelSlot/Barrel.get_node("CooldownTimer").wait_time = turret_data.value["cooldown"]
	
	# for ammo
	var new_ammo = load(AmmoData.new().type[turret_data.value["ammo_type"]]).instance()
	new_ammo.spread = turret_data.value["spread"]
	new_ammo.damage = turret_data.value["damage"]
	
	$BarrelSlot/Barrel.get_node("BulletSpawn").add_child(new_ammo)
	if turret_data.value["ammo_type"] == 2 :
		targeting_offfset = 0.0
	# connect signal from barrel to "shots_fired"
	$BarrelSlot/Barrel.connect("has_fired",self,"shots_fired")
	# get Funcref from barrel for turning it on/off (dewperciated?)
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
	if tracked_enemy != null:
		tracked_enemy.connect("tree_exiting",self,"update_tracked_enemy")
	
	
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

	pass # Replace with function body.


func _on_Clickable_clicked(state):
	if state:
		bonus_charge = 1
	else:
		bonus_charge = 0
	pass # Replace with function body.
