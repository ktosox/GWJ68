extends Node

var current_inventory

var next_pickup = 0

func send_to_inventory(data):
	# call relevant function in current_inventory
	current_inventory.add_item(data)
	pass

func take_from_inventory(data):
	current_inventory.remove_item(data.inventory_ID)
	pass

func create_next_drop(position):
	
	var new_pickup = load("res://stuff/pick_up.tscn").instance()
	new_pickup.global_position = position
	var possilbe_pickups = [BarrelData.new(),AmmoData.new(),BaseData.new()]
	var selected_pickup = possilbe_pickups[next_pickup%3]
	selected_pickup.randomize_values()
	new_pickup.payload = selected_pickup
	next_pickup += 1
	get_tree().current_scene.add_child(new_pickup)
	
	pass
