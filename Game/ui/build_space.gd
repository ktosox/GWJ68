extends Control

# implements can_drop drop_data to show a higligh of where and of something can be built


var turret_scene = preload("res://stuff/turret_stuff/turret.tscn")


func can_drop_data(position, data):
	# check if data is something that can be placed
	if data.item == "Turret":
		return true
	# if yes -> show highlight
	# check if location is valid
	# make the highlight tinted based on validity
	return false
	pass


func drop_data(position, data):
	# build the thing described by data at position
	var new_turret = turret_scene.instance()
	new_turret.position = position
	get_parent().add_child(new_turret)
	# consume turret from inventory
	GM.take_from_inventory(data)
	pass
