extends ColorRect

func load_property(texture : Texture, value ):
	$HBoxContainer/TextureRect.texture = texture
	$HBoxContainer/Label.text = String(value)
	pass
