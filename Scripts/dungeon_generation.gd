extends Node

var room = preload("res://Rooms/room_variation_1.tscn")

var min_rooms = 6
var max_rooms = 9

var generation_chance = 30

func generate(room_seed):
	seed(room_seed)
	var dungeon = {}
	
	var size = floor( randi_range(min_rooms, max_rooms))
	
	dungeon[Vector2(0,0)] = room.instantiate()
	size -= 1
	
	while(size > 0):
		for i in dungeon.keys():
			if(randi_range(0,100) < generation_chance):
				var direction = randi_range(0,4)
				
				if(direction < 1):
					var new_room_position = i + Vector2(1,0)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(1,0))
					
				elif(direction < 2):
					var new_room_position = i + Vector2(-1,0)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(-1,0))
					
				elif(direction < 3):
					var new_room_position = i + Vector2(0,1)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(0,1))
					
				elif(direction < 4):
					var new_room_position = i + Vector2(0,-1)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(0,-1))
					
	return dungeon
	
func connect_rooms(room1, room2, direction):
	room1.connected_rooms[direction] = room2
	room2.connected_rooms[-direction] = room1
	room1.number_of_connected_rooms += 1
	room2.number_of_connected_rooms += 1
