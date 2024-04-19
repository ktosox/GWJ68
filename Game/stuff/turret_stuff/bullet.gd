extends RigidBody2D



export var damage = 9



func _ready():
	pass # Replace with function body.



func get_damage():
	get_tree().create_timer(0.4).connect("timeout",self,"queue_free") # self desturct after 0.4 s
	return damage
