extends Control



func _on_Base_pressed():
	var new_data = BaseData.new()
	GM.send_to_inventory(new_data)
	pass # Replace with function body.


func _on_Barrel_pressed():
	var new_data = BarrelData.new()
	GM.send_to_inventory(new_data)
	pass # Replace with function body.


func _on_Ammo_pressed():
	var new_data = AmmoData.new()
	new_data.value["type"] = randi()%3
	GM.send_to_inventory(new_data)
	pass # Replace with function body.
