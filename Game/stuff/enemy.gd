extends RigidBody2D



export var health_max = 30

var health_current : int

# Called when the node enters the scene tree for the first time.
func _ready():
	health_current = health_max
	$HealthBar.max_value = health_max
	$HealthBar.value = health_current
	pass # Replace with function body.


func get_hit(damage):
	health_current -= damage
	$HealthBar.value = health_current
	if health_current < 0:
		die()
	pass

func die():
	queue_free()
	pass

func _on_HitBox_body_entered(body):
	
	if body.has_method("get_damage"):
		get_hit(body.get_damage())
	pass # Replace with function body.
	
