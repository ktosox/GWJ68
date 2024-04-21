class_name BaseData

extends Resource

var inventory_ID = 0

var item = "Base"

var icon = {
	0 : "res://resources/icons/flat-platform.png",
}

var type = {
	0 : "name"
}

var value = {
	"type" : 0,
	"battery" : 100,
	"recharge" : 0.5,
	"range" : 250,
	"bonus_cost" : 0
	
}

func randomize_values():
	value["battery"] += int(rand_range(-30,30) )
	value["recharge"] += int(rand_range(-1,5) ) * 0.1
	value["range"] += int(rand_range(-20,50) )


func get_icon():
	return load(icon[value["type"]])
	pass
