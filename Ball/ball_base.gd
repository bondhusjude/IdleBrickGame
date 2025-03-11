extends Resource
class_name Ball

@export var damage = 1
@export var speed = 500
@export var ballTexture: Texture2D

func setDamage(i: int):
	damage = i

func getDamage() -> int:
	return damage

func setSpeed(i: int):
	speed = i

func getSpeed() -> int:
	return speed

func setBallTexture(texture: Texture2D):
	ballTexture.texture = texture
