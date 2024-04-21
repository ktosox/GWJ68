extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var progress = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progress:
		$Icon/TextureProgress.value += delta * 40.0
	else:
		$Icon/TextureProgress.value -= delta * 15.0
	pass


func _on_TextureProgress_mouse_entered():
	progress = true
	pass # Replace with function body.


func _on_TextureProgress_mouse_exited():
	progress = false
	pass # Replace with function body.
