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

onready var player = Utils.get_player()

enum Personality {
	Chaser,
	StaticDefender,
	Passive,
}
export(Personality) var personality


func _ready():
	hands.weapon_id = weapon
	hands.ready()

func _process(_delta):
	attack()
	go()

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
			move_and_slide(velocity)
			position = position.round() #rounds position to pixel grid
			animation_mode.travel("Walk")
		else: # didn't move
			animation_mode.travel("Idle")

func _on_AttackRange_area_entered(_area):
	inside_attack_range = true
func _on_AttackRange_area_exited(_area):
	inside_attack_range = false
func _on_FollowRange_area_entered(_area):
	inside_follow_range = true
func _on_FollowRange_area_exited(_area):
	inside_follow_range = false
