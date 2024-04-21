extends ColorRect


var base : BaseData

var ammo : AmmoData

var barrel : BarrelData


func _on_ForgeButton_pressed():

	var new_turret = TurretData.new()
	# use data from all 3 slots to set TureetData
	new_turret.value["battery"] = base.value["battery"]
	new_turret.value["recharge"] = base.value["recharge"]
	new_turret.value["ammo_type"] = ammo.value["type"]
	new_turret.value["spread"] = barrel.value["spread"]
	new_turret.value["range"] = base.value["range"] * barrel.value["bonus_range"]
	new_turret.value["damage"] = ammo.value["damage"] + barrel.value["bonus_damage"]
	new_turret.value["cost"] = ammo.value["cost"] + base.value["bonus_cost"]
	new_turret.value["cooldown"] = ammo.value["cooldown"] + barrel.value["bonus_cooldown"]
	GM.send_to_inventory(new_turret)
	for slot in $SlotLayout.get_children():
		slot.delete_item()
	forge_check()
	pass # Replace with function body.

func forge_check():
	if base != null and ammo != null and barrel != null:
		$ForgeButton.disabled = false
	else:
		$ForgeButton.disabled = true
	pass



func _on_Base_item_state_changed(item):
	base = item
	forge_check()
	pass # Replace with function body.


func _on_Barrel_item_state_changed(item):
	barrel = item
	forge_check()
	pass # Replace with function body.


func _on_Ammo_item_state_changed(item):
	ammo = item
	forge_check()
	pass # Replace with function body.
