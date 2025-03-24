extends Resource
class_name GameManager

@export var _money = 0
@export var _crystal = 0
@export var _level = 1
@export var _goldBonus = 1.1
@export var _normal_brick_chance:float =  0.95
@export var _gold_brick_chance:float =    0.0407
@export var _crystal_brick_chance:float = 0.0003
@export var _moneyIncreaseCards:bool = false
@export var _stageIncreaseCards:bool = false
@export var _stageSkipCards:bool = false

func setStageSkip(value: bool):
	_stageSkipCards = value

func getStageSkip() -> bool:
	return _stageSkipCards

func setStageIncrease(value: bool):
	_stageIncreaseCards = value

func getStageIncrease() -> bool:
	return _stageIncreaseCards

func setMoneyIncrease(value: bool):
	_moneyIncreaseCards = value

func getMoneyIncrease() -> bool:
	return _moneyIncreaseCards

func setMoney(value: int):
	_money = value

func getMoney() -> int:
	return _money

func addMoney(add: int):
	if _moneyIncreaseCards:
		_money += add * 1.2
	else:
		_money += add

func removeMoney(minus: int):
	_money -= minus

func setCrystal(value: int):
	_crystal = value

func getCrystal() -> int:
	return _crystal

func addCrystal(add: int):
	_crystal += add

func removeCrystal(minus: int):
	_crystal -= minus

func getLevel() -> int:
	return _level

func addLevel():
	_level += 1

func setGoldBonus(value: float):
	_goldBonus = value

func getGoldBonus() -> float:
	return _goldBonus

func addGoldBonus(add: float):
	_goldBonus += add

# Setter and Getter for normal_brick_chance
func setNormalBrick(value: float):
	_normal_brick_chance = value

func getNormalBrick() -> float:
	return _normal_brick_chance

# Setter and Getter for gold_brick_chance
func setGoldBrick(value: float):
	_gold_brick_chance = value

func getGoldBrick() -> float:
	return _gold_brick_chance

# Setter and Getter for crystal_brick_chance
func setCrystalBrick(value: float):
	#push_error("I Was Called")
	_crystal_brick_chance = value

func getCrystalBrick() -> float:
	return _crystal_brick_chance
