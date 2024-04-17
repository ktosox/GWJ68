extends Node2D

# created out of a base + barrel + ammo type

# uses base for battery size + re-charge rate + efficency mod

# barrel 

var battery_max = 100.0

var battery_current = 0.0

var charge_rate = 0.5 

var efficiency_discount = 0.0

#var speed = 0.0

var damage = 0.0

var cost = 0.0

var cooldown = 0.0

var bonus_range


var tooltip_scene = preload("res://ui/turret_tooltip.tscn")
