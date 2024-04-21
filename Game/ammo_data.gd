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
	"damage" : 10,
	"cost" : 2,
	"cooldown" : 0.5
	
}

func get_icon():
	return load(icon[value["type"]])
	pass
