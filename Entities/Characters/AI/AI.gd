extends KinematicBody2D

#player walking speed
export var speed = 100

onready var animation_tree = $AnimationTree
onready var animation_mode = animation_tree["parameters/playback"]
onready var sprite = $Sprite
onready var hands = $Hands
onready var attack_range = $AttackRange
var inside_attack_range = false
onready var follow_range = $FollowRange
var inside_follow_range = false

export(Weapons.weapons) var weapon

onready var player = Player.get_reference()

enum Personality {
	Chaser,
	StaticDefender,
	Passive,
}
export(Personality) var personality


var hp
export var max_hp = 100


func _ready():
	hands.weapon_id = weapon
	hands.ready()
	hp = max_hp

func _process(_delta):
	attack()
	go()
	look_at_player()

func attack():
	if personality == Personality.Chaser || personality == Personality.StaticDefender:
		if inside_attack_range:
			hands.primary_attack();
		
func go():
	if personality == Personality.Chaser:
		var velocity = Vector2.ZERO
		if inside_follow_range:
			velocity = position.direction_to(player.position) * speed
		if velocity.length() > 0: # if moved
			var _suc = move_and_slide(velocity)
			position = position.round() #rounds position to pixel grid
			animation_mode.travel("Walk")
		else: # didn't move
			animation_mode.travel("Idle")

func look_at_player():
	var vec = Vector2(player.position.x - position.x, player.position.y - position.y)
	var blended = Utils.vec_to_pos_blended(vec)
	animation_tree.set('parameters/Idle/blend_position', blended)
	animation_tree.set('parameters/Walk/blend_position', blended)
	var angle = Utils.vec_to_angle(vec)
	if angle > 105 or angle < -105: #some space as to not flicker at border
		sprite.flip_h = true
	elif angle < 75 and angle >= 0 or\
		angle > -75 and angle <= 0:
		sprite.flip_h = false 
	hands.look_at_mouse(angle)


func damage(damage): # Will apply damage
	hp -= damage
	$Sprite.modulate = Color(1, hp/float(max_hp), hp/float(max_hp))
	if hp <= 0:
		die()

func die():
	set_deferred("visible", false)
	animation_mode.stop()
	GameManager.increase_stat(GameManager.stat.player.bloodshed, 1)
	GameManager.increase_stat(GameManager.stat.player.gold, 15)
	queue_free()


func _on_AttackRange_entered(_area):
	inside_attack_range = true
func _on_AttackRange_exited(_area):
	inside_attack_range = false
func _on_FollowRange_entered(_area):
	inside_follow_range = true
func _on_FollowRange_exited(_area):
	inside_follow_range = false
