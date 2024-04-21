extends Control

signal item_state_changed(item)

export(String, "Base", "Barrel", "Ammo") var accepted_item_type

var held_item : Resource # one of the accepted data types

func can_drop_data(position, data):
	if data.item == accepted_item_type:
		return true
		
	return false

func drop_data(position, data):
	if held_item != null:
		yeet_item()
	accept_item(data)
	load_item_icon()
	pass
	
func load_item_icon():
	# extract texture from held_item and set $TextureRect
	$TextureRect.texture = held_item.get_icon()
	pass

func accept_item(item_data):
	held_item = item_data

	GM.take_from_inventory(item_data)
	emit_signal("item_state_changed",held_item)
	pass

func yeet_item(): # called if has_item
	GM.send_to_inventory(held_item)
	held_item = null
	$TextureRect.texture = null
	emit_signal("item_state_changed",held_item)
	pass

func delete_item():
	$TextureRect.texture = null
	held_item = null
	emit_signal("item_state_changed",held_item)
	pass

func _on_ForgeSlot_gui_input(event):
	if event.is_action_pressed("LMB"):
		if held_item != null:
			yeet_item()
		pass
	pass # Replace with function body.
