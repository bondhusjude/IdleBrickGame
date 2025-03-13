extends Resource
class_name Brick

@export var health = 1
@export var status: Array = ["normal", "gold", "crystal"]
@export var assignedStatus: int = 0
@export var brickTexture: Texture2D
@export var gameMan: GameManager

#func adjust_gold_and_crystal(gold_increase: float, crystal_increase: float) -> void:
#	# Adjust gold and crystal
#	gameMan.setGoldBrick(gameMan.getGoldBrick() + gold_increase)
#	gameMan.setCrystalBrick(gameMan.getCrystalBrick() + crystal_increase)
#
#	# Calculate total probability
#	var total = gameMan.getNormalBrick() + gameMan.getGoldBrick() + gameMan.getCrystalBrick()
#
#	# If over 1.0, reduce from normal
#	if total > 1.0:
#		var excess = total - 1.0
#		gameMan.setNormalBrick(gameMan.getNormalBrick() - excess)
#		if gameMan.getNormalBrick() < 0:
#			push_error("Normal Brick is less than Zero")
#			gameMan.setNormalBrick(0)

func assignStatus():
	var roll = randf()  # Random float between 0.0 and 1.0
	#print(roll)
	#print(gameMan.getNormalBrick() + gameMan.getGoldBrick())
	## IMPORTANT the value crystal brick chance will not show up in the debugger because it is too small
	# however it is still that value I already tested it
	#print(gameMan.getCrystalBrick())
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
