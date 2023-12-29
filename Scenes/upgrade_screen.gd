extends Control

var healthbuff = 0
var damagebuff = 0

var upgrades = ["health+1", "damage+1"]
var upgrade_texture = {
	"health+1": preload("res://Assets/Upgrades/buff_+1_Heart.png"),
	"damage+1": preload("res://Assets/Upgrades/buff_+1_damage.png")
}
var upgrade_buff = {
	"health+1": 1,
	"damage+1": 1
}

var upgrade_0: String
var upgrade_1: String
var upgrade_2: String

var buff_var_0: int
var buff_var_1: int
var buff_var_2: int

var upgrade_name: String
var upgrade_number: int

func _ready():
	upgrade_0 = upgrades.pick_random()
	upgrade_1 = upgrades.pick_random()
	upgrade_2 = upgrades.pick_random()

	upgrade_0_manager()
	upgrade_1_manager()
	upgrade_2_manager()

	init_buff_vars()

func upgrade_0_manager():
	var texture = upgrade_texture.get(upgrade_0)
	$Upgrade0.texture_normal = texture

func upgrade_1_manager():
	var texture = upgrade_texture.get(upgrade_1)
	$Upgrade1.texture_normal = texture

func upgrade_2_manager():
	var texture = upgrade_texture.get(upgrade_2)
	$Upgrade2.texture_normal = texture

func init_buff_vars():
	buff_var_0 = healthbuff if upgrade_0 == "health+1" else damagebuff
	buff_var_1 = healthbuff if upgrade_1 == "health+1" else damagebuff
	buff_var_2 = healthbuff if upgrade_2 == "health+1" else damagebuff

func _on_upgrade_pressed(upgrade_name: String, upgrade_number: int):
	var buff_value = upgrade_buff.get(upgrade_name, 0)
	var buffvar

	# Determine which buff_var to use based on upgrade_number
	match upgrade_number:
		0: buffvar = buff_var_0
		1: buffvar = buff_var_1
		2: buffvar = buff_var_2

	# Update buff_var based on buff_value
	buffvar += buff_value

	# Update healthbuff or damagebuff based on upgrade_name
	if upgrade_name == "health+1":
		healthbuff = buffvar
	elif upgrade_name == "damage+1":
		damagebuff = buffvar

	# Update specific buff_var based on upgrade_number
	match upgrade_number:
		0: buff_var_0 = buffvar
		1: buff_var_1 = buffvar
		2: buff_var_2 = buffvar

	# Reinitialize buff variables after upgrade
	init_buff_vars()

	# Print for debugging
	print(upgrade_name, ":", buffvar)
	print("Health:", healthbuff)
	print("Damage:", damagebuff)
	
func _on_upgrade_0_pressed():
	_on_upgrade_pressed(upgrade_0, 0)

func _on_upgrade_1_pressed():
	if upgrade_0 == upgrade_1:
		upgrade_name = upgrade_0
		upgrade_number = 0
	else:
		upgrade_name = upgrade_1
		upgrade_number = 1

	_on_upgrade_pressed(upgrade_name, upgrade_number)

func _on_upgrade_2_pressed():
	if upgrade_0 == upgrade_2:
		upgrade_name = upgrade_0
		upgrade_number = 0
	elif upgrade_1 == upgrade_2:
		upgrade_name = upgrade_1
		upgrade_number = 1
	else:
		upgrade_name = upgrade_2
		upgrade_number = 2

	_on_upgrade_pressed(upgrade_name, upgrade_number)

