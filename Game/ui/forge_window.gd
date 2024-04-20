extends ColorRect

var slot_state = [false,false,false]

func _on_ForgeButton_pressed():
	for slot in $SlotLayout.get_children():
		slot.delete_item()
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
