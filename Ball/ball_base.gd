extends Resource
class_name Ball

@export var damage = 1
@export var speed = 500
@export var ballTexture: Texture2D
@export var doubleDamage: bool
@export var doubleSpeed: bool

func setDoubleDamage(i: bool):
	doubleDamage = i

func getDoubleDamage() -> bool:
	return doubleDamage

func setDoubleSpeed(i: bool):
	doubleSpeed = i

func getDoubleSpeed() -> bool:
	return doubleSpeed

func setDamage(i: int):
	damage = i

func getDamage() -> int:
	if doubleDamage:
		return damage * 2
	return damage

func setSpeed(i: int):
	speed = i

func getSpeed() -> int:
	if doubleSpeed:
		return speed * 2
	return speed

func setBallTexture(texture: Texture2D):
	ballTexture.texture = texture
