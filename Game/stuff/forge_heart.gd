extends Node2D

export var health_max = 200

var health: int

func _ready():
	health = health_max
	$HealthBar.max_value = health_max
	$HealthBar.value = health
	pass

func get_hit(damage):
	health -= damage
	$HealthBar.value = health
	if health <= 0 :
		print("lose game")


func _on_RigidBody2D_body_entered(body):
	get_hit(body.health)
	
	body.die()
	pass # Replace with function body.
