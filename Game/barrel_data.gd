class_name BarrelData

extends Resource

var inventory_ID = 0

var item = "Barrel"

var icon = {
	0 : "res://resources/icons/straight-pipe.png",
}

var type = {
	0 : "res://stuff/turret_stuff/barrel.tscn",
	
	
}


var value = {
	"type" : 0,
	"spread" : 1,
	"bonus_cooldown" : 0.9,
	"bonus_range" : 1.2,
	"bonus_damage" : 1
}

func get_icon():
	return load(icon[value["type"]])
	pass
