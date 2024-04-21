class_name AmmoData

extends Resource

var inventory_ID = 0

var item = "Ammo"

var icon = {
	0 : "res://resources/icons/heavy-bullets.png",
	1 : "res://resources/icons/striking-balls.png",
	2 : "res://resources/icons/supersonic-bullet.png"
}

#var type_to_name = {
#	0 : "res://stuff/turret_stuff/ammo/ammo.tscn",
#	1 : "res://stuff/turret_stuff/ammo/shotgun.tscn",
#	2 : "res://stuff/turret_stuff/ammo/machine_gun.tscn"
#}

var type = {
	0 : "res://stuff/turret_stuff/ammo/ammo.tscn",
	1 : "res://stuff/turret_stuff/ammo/shotgun.tscn",
	2 : "res://stuff/turret_stuff/ammo/machine_gun.tscn"
}

var value = {
	"type" : 0,
	"damage" : 5,
	"cost" : 3,
	"cooldown" : 0.5
	
}

func randomize_values():
	value["damage"] += int (rand_range(-1,5) )
	value["cost"] += int(rand_range(-1,2) )
	value["cooldown"] += int(rand_range(-2,4))*0.1
	value["type"] = randi()%3

func get_icon():
	return load(icon[value["type"]])
	pass
