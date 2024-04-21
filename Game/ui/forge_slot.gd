extends Control

signal item_state_changed(state)

export(String, "Base", "Barrel", "Ammo") var accepted_item_type

var held_item : Resource # one of the accepted data types

var has_item = false

func can_drop_data(position, data):
	if data.item == accepted_item_type:
		return true
		
	return false

func drop_data(position, data):
	if has_item:
		yeet_item()
	accept_item(data)
	load_item_icon()
	pass
	
func load_item_icon():
	# extract texture from held_item and set $TextureRect
	pass

func accept_item(item_data):
	held_item = item_data
	has_item = true
	GM.take_from_inventory(item_data)
	emit_signal("item_state_changed",has_item)
	pass

func yeet_item(): # called if has_item
	GM.send_to_inventory(held_item)
	held_item = null
	has_item = false
	emit_signal("item_state_changed",has_item)
	pass

func delete_item():
	has_item = false
	held_item = null
	emit_signal("item_state_changed",has_item)
	pass

func _on_ForgeSlot_gui_input(event):
	if event.is_action_pressed("LMB"):
		if has_item:
			yeet_item()
		pass
	pass # Replace with function body.
