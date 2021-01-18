extends Node

var stat = {
	player = {gold = 0, bloodshed=1},
	player_team = {gold = 2, bloodshed=3},
	enemy_team = {gold = 4, bloodshed=5},
	team_armor = [6,7,8,9,10,11],
	time = {minutes = 12, seconds = 13},
	score = {player_team = 14, enemy_team = 15},
}
var stat_count = 16
var stat_data = []

signal stat_changed(stat, value)

func _ready():
	for _i in range(stat_count):
		stat_data.append(0)

func change_stat(stat_id, value):
	stat_data[stat_id] = value
	emit_signal("stat_changed", stat_id, value)

func get_stat(stat_id):
	return stat_data[stat_id]

func increase_stat(stat_id, value):
	stat_data[stat_id] += value
	emit_signal("stat_changed", stat_id, stat_data[stat_id])
