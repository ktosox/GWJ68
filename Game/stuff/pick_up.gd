extends RigidBody2D


export var payload : Resource # data of whatever the pick up has

# Called when the node enters the scene tree for the first time.
func _ready():
	$Center/Texture.texture = payload.get_icon()
	
	pass # Replace with function body.








func _on_Clickable_clicked(state):
	if state:
		GM.send_to_inventory(payload)
		queue_free()
	pass # Replace with function body.


func _on_PickUp_body_entered(body):
	set_deferred("mode",RigidBody2D.MODE_STATIC)

	pass # Replace with function body.
