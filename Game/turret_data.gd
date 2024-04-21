class_name TurretData

extends Resource

var inventory_ID = 0

var item = "Turret"

var icon = {
	0 : "res://resources/icons/turret.png",
}

var value = {
	"type" : 0,
	"battery" : 100,
	"recharge" : 1.6,
	"ammo_type" : 0,
	"damage" : 10,
	"cost" : 5,
	"cooldown" : 2,
	"spread" : 0.2,
	"range" : 200
}



func get_icon():
	return load(icon[value["type"]])
	pass
