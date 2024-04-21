extends RigidBody2D

var death_effect = preload("res://stuff/puff_of_smoke.tscn")

export var health_max = 30

var health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	health = health_max
	$HealthBar.max_value = health_max
	$HealthBar.value = health
	pass # Replace with function body.


func get_hit(damage):
	health -= damage
	$HealthBar.value = health
	if health <= 0:
		die()
	pass

func die():
	var smoke = death_effect.instance()
	smoke.global_position = global_position
	get_parent().add_child(smoke)
	queue_free()
	pass

func _on_HitBox_body_entered(body):
	
	if body.has_method("get_damage"):
		get_hit(body.get_damage())
	pass # Replace with function body.
	
