extends Node

var network = NetworkedMultiplayerENet.new()

var ip = "127.0.0.1"
var port = 1909

var players_info = {}

func _ready():
	connect_to_server()
	
func connect_to_server():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed", self, "on_connection_failed")
	network.connect("connection_succeeded", self, "on_connection_succeeded")
	network.connect("peer_disconnected", self, "on_player_disconnected")
	network.connect("peer_connected", self, "register_player")
	

func on_player_disconnected(id):
	players_info.erase(id) # Erase player from info.

func on_connection_failed():
	print("Failed to connect")
	
func on_connection_succeeded():
	print("Succesfully connected")
	
func fetch_data(data_name, requestor):
	rpc_id(1, "fetch_data", data_name, requestor)
	
func report_position(position):
	rpc_unreliable("move_player", position)

remote func return_data(s_data, requestor):
	instance_from_id(requestor).set_data(s_data)
	
func register_player(id):
	if id == 1:
		return
	# Get the id of the RPC sender.
	#var id = get_tree().get_rpc_sender_id()
	var player = preload("res://Scenes/Enemy.tscn").instance()
	player.set_name(str(id))
	player.set_network_master(id)
	get_node("/root/Game").add_child(player)
	players_info[id] = {node = player}
	print(players_info)
	

remote func move_player(position):
	# Get the id of the RPC sender.
	var id = get_tree().get_rpc_sender_id()
	# Store the info
	get_node("/root/Game/"+str(id)).position = position


