extends Area2D

@onready var gate = $Gate2

func _on_area_entered(area):
	gate.visible = true
