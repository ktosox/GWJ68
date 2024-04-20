extends VBoxContainer

var invetory_item_scene = preload("res://ui/inventory_item.tscn")

var ID_tracker = 100

var item_list = {}

func _ready():
	GM.current_inventory = self

func add_item(data):
	var new_item = invetory_item_scene.instance()
	new_item.payload = data
	new_item.ID = ID_tracker
	item_list[ID_tracker] = new_item
	ID_tracker += 1
	$ItemHolder.add_child(new_item)
	pass


func remove_item(item_ID):
	
	var item_to_remove = item_list[item_ID]
	
	item_to_remove.queue_free()
	item_list.erase(item_ID)
	
	pass
