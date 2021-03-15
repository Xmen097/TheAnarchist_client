extends KinematicBody2D

var is_projectile = true

var direction
var sprite_data
var damage
export var speed = 1

func _ready():
	var sprite = $Sprite
	sprite.flip_h = sprite_data.flip_h
	sprite.frame_coords.y = sprite_data.y
	direction = Vector2(cos(PI*sprite_data.angle/180.0), -sin(PI*sprite_data.angle/180.0)).normalized()
	$Collider.rotation_degrees = -sprite_data.angle

func _physics_process(delta): # Position rounded to be whole pixel
	var result = move_and_collide(direction * speed)
	if result:
		hit(result.collider)

func die(): # The arrow should dissapear, is called from timer
	queue_free()
	
func hit(body):
	position = position.round()
	direction = Vector2(0,0) #Stop movement
	if body.is_in_group("Hittable"):
		body.hit(Weapons.types.Projectile, damage)
