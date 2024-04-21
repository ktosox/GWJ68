extends Node2D



func _on_SpawnTurret_pressed():
	GM.send_to_inventory(TurretData.new())
	pass # Replace with function body.
