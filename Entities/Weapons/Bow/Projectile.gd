extends Area2D

var vector
var sprite_data
var damage
export var speed = 20

func _ready():
	var sprite = $Sprite
	sprite.flip_h = sprite_data.flip_h
	sprite.frame_coords.y = sprite_data.y
	vector = Vector2(cos(PI*sprite_data.angle/180.0), -sin(PI*sprite_data.angle/180.0))
	$Collider.rotation_degrees = -sprite_data.angle

func _process(delta): # Position rounded to be whole pixel
	position = Vector2(round(position.x + vector.x * speed * delta), round(position.y + vector.y * speed * delta))

func _on_body_entered(body):
	vector = Vector2(0,0) #Stop movement
	body.hit(Weapons.types.projectile, damage)

func die(): # The arrow should dissapear, is called from timer
	queue_free()
