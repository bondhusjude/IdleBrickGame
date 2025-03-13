extends Control

@onready var extra_menu = $ExtraMenu
@onready var upgrades = $ExtraMenu/Upgrades
@onready var cards = $ExtraMenu/Cards
@onready var boosts = $ExtraMenu/Boosts

func _hide_all():
	upgrades.set_visible(false)
	cards.set_visible(false)
	boosts.set_visible(false)

func _on_upgrades_pressed() -> void:
	if upgrades.is_visible():
		extra_menu.set_visible(false)
		_hide_all()
	else:
		extra_menu.set_visible(true)
		_hide_all()
		upgrades.set_visible(true)

func _on_cards_pressed() -> void:
	if cards.is_visible():
		extra_menu.set_visible(false)
		_hide_all()
	else:
		extra_menu.set_visible(true)
		_hide_all()
		cards.set_visible(true)

func _on_boosts_pressed() -> void:
	if boosts.is_visible():
		extra_menu.set_visible(false)
		_hide_all()
	else:
		extra_menu.set_visible(true)
		_hide_all()
		boosts.set_visible(true)
