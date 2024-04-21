extends Control

# implements can_drop drop_data to show a higligh of where and of something can be built


var turret_scene = preload("res://stuff/turret_stuff/turret.tscn")

var preview_offset = Vector2(-50,-50)

func can_drop_data(position, data):
	# check if data is something that can be placed
	if data.item == "Turret":
		$Preview.rect_position = position + preview_offset
		$Preview.visible = true
	
	# is location valid?
	if $Preview.rect_position.x < 500 :
		$Preview.color = ColorN("green")
		return true
	# if yes -> show highlight

	$Preview.color = ColorN("red")
	return false
	pass


func drop_data(position, data):
	# build the thing described by data at position
	var new_turret = turret_scene.instance()
	new_turret.turret_data = data
	new_turret.position = position
	get_parent().add_child(new_turret)
	# consume turret from inventory
	GM.take_from_inventory(data)
	pass


func _gui_input(event):
	if event.is_class("InputEventMouseMotion") and !Input.is_action_pressed("LMB") :
		$Preview.visible = false
