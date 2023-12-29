extends Control

enum UpgradeType { HEALTH, DAMAGE }

var healthbuff = 0
var damagebuff = 0

var upgrades = [UpgradeType.HEALTH, UpgradeType.DAMAGE]
var upgrade_texture = {
	UpgradeType.HEALTH: preload("res://Assets/Upgrades/buff_+1_Heart.png"),
	UpgradeType.DAMAGE: preload("res://Assets/Upgrades/buff_+1_damage.png")
}
var upgrade_buff = {
	UpgradeType.HEALTH: 1,
	UpgradeType.DAMAGE: 1
}

func _ready():
	for button in $UpgradeButtons.get_children():
		assign_random_upgrade(button)

func assign_random_upgrade(button):
	var upgrade_type = upgrades.pick_random()
	var texture = upgrade_texture.get(upgrade_type)
	
	button.texture_normal = texture
	button.custom_data.upgrade_type = upgrade_type

func _on_upgrade_pressed(button):
	var upgrade_type = button.custom_data.upgrade_type
	var buff_value = upgrade_buff.get(upgrade_type, 0)

	if upgrade_type == UpgradeType.HEALTH:
		healthbuff += buff_value
	elif upgrade_type == UpgradeType.DAMAGE:
		damagebuff += buff_value

	print("Health Buff:", healthbuff)
	print("Damage Buff:", damagebuff)

func _on_button_pressed(button):
	_on_upgrade_pressed(button)


func _on_upgrade_2_pressed():
	pass # Replace with function body.


func _on_upgrade_1_pressed():
	pass # Replace with function body.


func _on_upgrade_0_pressed():
	pass # Replace with function body.
