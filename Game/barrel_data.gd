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
	"spread" : 0.15,
	"bonus_cooldown" : 0.9,
	"bonus_range" : 1.2,
	"bonus_damage" : 0
}

func randomize_values():
	value["spread"] += int(rand_range(1,2) ) * 0.1 
	value["bonus_cooldown"] += int(rand_range(-0.8,0.4) ) * 0.1
	value["bonus_range"] += int(rand_range(-3,7) ) * 0.1
	value["bonus_damage"] += int(rand_range(0,2) )

func get_icon():
	return load(icon[value["type"]])
	pass
