extends Resource
class_name Ball

@export var damage = 1
@export var speed = 500
@export var ballTexture: Texture2D
@export var doubleDamageBoost: bool
@export var doubleSpeedBoost: bool
@export var doubleDamageCard: bool
@export var doubleSpeedCard: bool

func setDoubleDamageC(i: bool):
	doubleDamageCard = i

func getDoubleDamageC() -> bool:
	return doubleDamageCard

func setDoubleSpeedC(i: bool):
	doubleSpeedCard = i

func getDoubleSpeedC() -> bool:
	return doubleSpeedCard

func setDoubleDamageB(i: bool):
	doubleDamageBoost = i

func getDoubleDamageB() -> bool:
	return doubleDamageBoost

func setDoubleSpeedB(i: bool):
	doubleSpeedBoost = i

func getDoubleSpeedB() -> bool:
	return doubleSpeedBoost

func setDamage(i: int):
	damage = i

func getDamage() -> int:
	var multiplier = 1
	if doubleDamageBoost:
		multiplier *= 2
	if doubleDamageCard:
		multiplier *= 2
	return damage * multiplier

func setSpeed(i: int):
	speed = i

func getSpeed() -> int:
	var multiplier = 1
	if doubleSpeedBoost:
		multiplier *= 2
	if doubleSpeedCard:
		multiplier *= 2
	return speed * multiplier

func setBallTexture(texture: Texture2D):
	ballTexture.texture = texture
