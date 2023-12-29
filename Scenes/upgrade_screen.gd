extends Control

var healthbuff = 0
var damagebuff = 0

var upgrades = ["health+1"]
var upgrade_texture = {
	"health+1" = ""
}
var upgrade_buff = {
	"health+1" = healthbuff
}
var upgrade_buff_value = {
	"health+1" = 1
}



func _ready():
	upgrade_0_manager()
	var upgrade_1 = upgrades.pick_random()
	var upgrade_2 = upgrades.pick_random()
	
	

func upgrade_0_manager():
	var upgrade_0 = upgrades.pick_random()
	
	var upgrade_texture = upgrade_texture.get(upgrade_0)
	var upgrade_buff = upgrade_buff.get(upgrade_0)
	var upgrade_buff_value = upgrade_buff_value.get(upgrade_0)
	var button = $"BoxContainer/Upgrade 0"
	
	button.texture_normal = load(upgrade_texture)
	
	
func _on_upgrade_0_pressed():
	pass # Replace with function body.

func _on_upgarde_1_pressed():
	pass # Replace with function body.

func _on_upgarde_2_pressed():
	pass # Replace with function body.
