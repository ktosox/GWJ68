extends Control





# Called when the node enters the scene tree for the first time.
func _ready():
	load_data(TurretData.new())
	pass # Replace with function body.

func load_data(data : TurretData):
	var slots = get_children()
	for key in data.value.keys():
		var slot = slots.pop_front()
		slot.load_property(load(data.texture[key]), data.value[key])
		
	pass
