extends ColorRect

var slot_state = [false,false,false]

func _on_ForgeButton_pressed():
	for slot in $SlotLayout.get_children():
		slot.delete_item()
	var new_turret = TurretData.new()
	# use data from all 3 slots to set TureetData
	GM.send_to_inventory(new_turret)
	forge_check()
	pass # Replace with function body.

func forge_check():
	if slot_state[0] and slot_state[1] and slot_state[2]:
		$ForgeButton.disabled = false
	else:
		$ForgeButton.disabled = true
	pass

func _on_ForgeSlot_item_state_changed(state):
	slot_state[0] = state
	forge_check()
	pass # Replace with function body.


func _on_ForgeSlot2_item_state_changed(state):
	slot_state[1] = state
	forge_check()
	pass # Replace with function body.


func _on_ForgeSlot3_item_state_changed(state):
	slot_state[2] = state
	forge_check()
	pass # Replace with function body.
