extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var progress = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	var test_turret = TurretData.new()
	test_turret.value["ammo_type"] = 2
	GM.send_to_inventory(test_turret)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_TextureProgress_mouse_entered():
	progress = true
	pass # Replace with function body.


func _on_TextureProgress_mouse_exited():
	progress = false
	pass # Replace with function body.
