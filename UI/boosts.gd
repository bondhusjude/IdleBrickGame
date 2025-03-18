extends Node
## for each ball we need the basic base of it so that we can update it
@export var ball_base: Ball
@export var GameManClass: GameManager
@onready var GameMan = $"../../../GameManager"

func canPay(price: int) -> bool:
	if price >= GameManClass.getCrystal():
		return true
	return false

func _on_double_damage_pressed() -> void:
	if canPay(1):
		GameManClass.removeCrystal(1)
		ball_base.doubleDamage == true
		await get_tree().create_timer(30).timeout
		ball_base.doubleDamage == false
	else:
		print("Cannot Pay for Item")

func _on_double_speed_pressed() -> void:
	if canPay(1):
		GameManClass.removeCrystal(1)
		ball_base.doubleSpeed == true
		await get_tree().create_timer(30).timeout
		ball_base.doubleSpeed == false
	else:
		print("Cannot Pay for Item")

func _on_double_cash_pressed() -> void:
	if canPay(1):
		GameManClass.addMoney(GameManClass.getMoney())
	else:
		print("Cannot Pay for Item")

func _on_skip_level_pressed() -> void:
	if canPay(1):
		GameManClass.removeCrystal(1)
		GameMan.moveNextLevel()
	else:
		print("Cannot Pay for Item")
