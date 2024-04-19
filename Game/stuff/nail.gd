extends RigidBody2D


export var damage = 4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_damage():
	get_tree().create_timer(0.4).connect("timeout",self,"queue_free") # self desturct after 0.4 s
	return damage

