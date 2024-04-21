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
	"range" : 200,
	"bonus_cost" : 0
	
}

func get_icon():
	return load(icon[value["type"]])
	pass
