extends Area2D


var hp
var max_hp = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = max_hp

func damage(damage): # Strawman damaged, apply damage
	hp -= damage
	$Sprite.modulate = Color(1, hp/100.0, hp/100.0)
	if hp <= 0:
		die()
		
func die(): # hide strawman from scene, in the future it should be removed from the scene tree
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite.set_deferred("visible", false)
