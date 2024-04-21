extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	
	GM.send_to_inventory(TurretData.new())

	GM.send_to_inventory(BaseData.new())
	var new_data = BaseData.new()
	new_data.value["battery"] = 120
	GM.send_to_inventory(new_data)

	GM.send_to_inventory(BarrelData.new())
	new_data = BarrelData.new()
	new_data.value["bonus_range"] = 1.8
	GM.send_to_inventory(new_data)
	new_data = AmmoData.new()
	new_data.value["type"] = 2
	GM.send_to_inventory(new_data)
	new_data = AmmoData.new()
	new_data.value["type"] = 1
	GM.send_to_inventory(new_data)
	pass # Replace with function body.

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Reset_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_ForgeHeart_game_over():
	$UI/LoseScreen.visible = true
	get_tree().paused = true
	pass # Replace with function body.


func _on_LevelControl_animation_finished(anim_name):
	get_tree().paused = true
	pass # Replace with function body.
