extends Resource
class_name Brick

@export var health = 10
@export var brickTexture: Texture2D

func healthAdd(add: int):
	health += add

func healthMinus(minus: int):
	health -= minus

func getHealth() -> int: 
	return health

func setBrickTexture(texture: Texture2D):
	brickTexture.texture = texture
