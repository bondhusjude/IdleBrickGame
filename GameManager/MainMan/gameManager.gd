extends Resource
class_name GameManager

@export var money = 0
@export var level = 1

func getMoney() -> int:
	return money

func addMoney(add: int):
	money += add

func removeMoney(minus: int):
	money -= minus

func getLevel() -> int:
	return level

func addLevel():
	level += 1
