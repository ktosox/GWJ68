extends RigidBody2D

export var damage = 3



func _ready():
	pass # Replace with function body.



func get_damage():
	get_tree().create_timer(0.1).connect("timeout",self,"queue_free") # self desturct after 0.4 s
	return damage


func _on_Shell_body_entered(body):
	queue_free()
	pass # Replace with function body.
