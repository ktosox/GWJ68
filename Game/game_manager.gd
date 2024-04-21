extends Node

var current_inventory



func send_to_inventory(data):
	# call relevant function in current_inventory
	current_inventory.add_item(data)
	pass

func take_from_inventory(data):
	current_inventory.remove_item(data.inventory_ID)
	pass
