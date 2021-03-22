extends KinematicBody2D

var id
var item
var velocity
var end_position
var rotspeed

export(int) var speed
export (int) var fall_treshold = 3

var flying = true

onready var animationPlayer = $AnimationPlayer
onready var dieTimer = $DieTimer
onready var effect = $Effects/Viewport/Particles

func _ready():
	var sprite = $Sprite
	sprite.texture.region = Rect2(id * 28, 0, 28, sprite.texture.region.size.y)
	effect.rotation_degrees = Utils.vec_to_angle(velocity) * -1 
	animationPlayer.play("Rotate")
	animationPlayer.seek(rand_range(0, 3.7), true)
	animationPlayer.playback_speed = rotspeed


func _physics_process(_delta):
	if not flying:
		return

	var result = move_and_collide(velocity*speed)
	if result or position.distance_to(end_position) < fall_treshold:
		stop()

# If Throwable passes Collider Area of Enemy, enemy will check whether to call stop()
func stop():
	animationPlayer.stop()
	position = position.round()
	effect.emitting = false
	item.dropped()
	dieTimer.start()
	flying = false

func die():
	queue_free()
