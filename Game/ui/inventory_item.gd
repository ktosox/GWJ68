extends TextureRect

var payload : Resource

var type_to_icon ={
	"Turret" : "res://resources/icons/turret.png",
	"Base" : "res://resources/icons/flat-platform.png",
	"Barrel" : "res://resources/icons/straight-pipe.png",
	"Ammo" : "res://resources/icons/heavy-bullets.png"
}

func _ready():
	texture = load(type_to_icon[payload.item])
	make_tooltip()
	pass

func make_tooltip():
	var tooltip = "|"
	for i in payload.value.keys():
		if i == "type":
			pass
		elif payload.value[i] == 0:
			pass
		else:
			tooltip += i +" : "+ String(payload.value[i]) +"|"
	hint_tooltip = tooltip
	pass

func get_drag_data(position):
	var preview = TextureRect.new()
	preview.rect_size = rect_size
	preview.expand = expand
	preview.stretch_mode = stretch_mode
	preview.texture = texture
	set_drag_preview(preview)
	return payload
