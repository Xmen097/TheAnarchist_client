extends TileSet
tool

var no_border = TileMap.find_tile_by_name("road_no_border")
var border = TileMap.find_tile_by_name("road_border")

func _is_tile_bound(drawn_id, neighbor_id):
	return drawn_id == no_border and neighbor_id == border
