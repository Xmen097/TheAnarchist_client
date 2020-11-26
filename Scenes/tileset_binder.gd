# Script added to tilesets to change binding rules
# In the future should be more generalized to apply to more spritesheets

extends TileSet
tool

var road_no_border = find_tile_by_name("road_no_border")
var road_border = find_tile_by_name("road_border")
var grass_no_border = find_tile_by_name("grass_no_border")
var grass_border = find_tile_by_name("grass_border")

func _is_tile_bound(drawn_id, neighbor_id):
	return drawn_id == grass_no_border and neighbor_id == grass_border or \
		drawn_id == road_no_border and neighbor_id == road_border or \
		drawn_id == grass_no_border and neighbor_id == road_border or \
		drawn_id == road_no_border and neighbor_id == grass_border
