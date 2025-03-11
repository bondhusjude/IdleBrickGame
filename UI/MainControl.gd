extends Control
@onready var extra_menu = $ExtraMenu
@onready var upgrades = $ExtraMenu/Upgrades

func _on_upgrades_pressed() -> void:
	if upgrades.is_visible():
		extra_menu.set_visible(false)
		upgrades.set_visible(false)
	elif !upgrades.is_visible():
		extra_menu.set_visible(true)
		upgrades.set_visible(true)
