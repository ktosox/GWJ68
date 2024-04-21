extends Node2D

var pickup_scene = preload("res://stuff/pick_up.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var possible_pickups = [AmmoData,BarrelData,BaseData]
	var new_pickup = pickup_scene.instance()
	new_pickup.payload = possible_pickups[randi()%possible_pickups.size()].new()
	new_pickup.global_position = $Button.rect_global_position
	add_child(new_pickup)
	pass # Replace with function body.
