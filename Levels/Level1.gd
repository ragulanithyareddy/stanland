extends Node2D

func _ready():
	if Global.door_name:
		var door_node = find_node(Global.door_name)
		if door_node:
			$YSort/MainPlayer.position.x = 376
			$YSort/MainPlayer.position.y = 2008
