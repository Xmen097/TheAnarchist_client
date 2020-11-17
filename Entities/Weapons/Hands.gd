extends Node2D

onready var weapon_animation_tree = $Weapons/AnimationTree
onready var weapon_animation_mode = weapon_animation_tree["parameters/playback"]
onready var hands_animation_tree = $AnimationTree

var active_weapon: Node
var mouse_angle = 0

func look_at_mouse():
	if !active_weapon.attacking:  # change only when weapon is not attackng
		mouse_angle = Utils.mouse_angle()
	active_weapon.look_at_mouse(mouse_angle)
	
	hands_animation_tree.set('parameters/Hands_idle/blend_position', Utils.mouse_pos_blended())
	

func _input(event):
	if event.is_action_pressed("attack") and !active_weapon.attacking:
		active_weapon.primary_attack(weapon_animation_mode)

func _ready():
	active_weapon = $Weapons/Halberd
	active_weapon.init(weapon_animation_mode)

func _process(_delta):
	look_at_mouse()

func on_weapon_idle():
	active_weapon.idle()
