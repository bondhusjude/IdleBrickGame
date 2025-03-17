extends Resource
class_name Brick

@export var health = 1
@export var status: Array = ["normal", "gold", "crystal"]
@export var assignedStatus: int = 0
@export var brickTexture: Texture2D
@export var gameMan: GameManager

func assignStatus():
	var roll = randf()  # Random float between 0.0 and 1.0
	## IMPORTANT the value crystal brick chance will not show up in the debugger because it is too small
	## however it is still that value I already tested it
	if roll < gameMan.getNormalBrick():
		assignedStatus = 0
	elif roll < gameMan.getNormalBrick() + gameMan.getGoldBrick():
		assignedStatus = 1
	else:
		assignedStatus = 2

func getStatus() -> int:
	return assignedStatus

func setHealth(value: int):
	health = value

func healthAdd(add: int):
	health += add

func healthMinus(minus: int):
	health -= minus

func getHealth() -> int: 
	return health

func setBrickTexture(texture: Texture2D):
	brickTexture.texture = texture
