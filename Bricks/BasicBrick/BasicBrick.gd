extends Area2D
@export var brick: Brick
@export var amIHex: bool = false
@onready var statBody = $StaticBody2D
@onready var label = $Label
@export var gameMan: GameManager

func _ready():
	if brick:
		brick = brick.duplicate(true)
		brick.setHealth(calculate_health(1, gameMan.getLevel()))
		brick.assignStatus()
		label.add_theme_font_size_override("font_size", 50)
		# Change the font color if its not normal
		if brick.getStatus() == 1:
			#label.font_color = Color.GOLD
			label.add_theme_color_override("font_color", Color.GOLD)
		elif brick.getStatus() == 2:
			#label.font_color = Color.BLUE_VIOLET
			label.add_theme_color_override("font_color", Color.BLUE_VIOLET)
		label.text = str(brick.getHealth())

func calculate_health(base: int, level: int) -> int:
	if amIHex:
		return 2 * int(base * (level + 1) * log(level + 2))
	else:
		return int(base * (level + 1) * log(level + 2))

func _on_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":  # Alternative to `is Ball`
		if brick.getStatus() == 0:
			normalHit(body.damage)
		else:
			unNormalHit(body.damage)
		label.text = str(brick.health)

func normalHit(received_damage: int):
	if brick.getHealth() > received_damage:
		brick.healthMinus(received_damage)
		gameMan.addMoney(received_damage)
	else:
		gameMan.addMoney(brick.getHealth())
		iDied()

func unNormalHit(received_damage):
	if brick.getHealth() > received_damage:
		brick.healthMinus(received_damage)
	else:
		if brick.getStatus() == 2:
			gameMan.addCrystal(1)
		else:
			gameMan.addMoney(round(gameMan.getGoldBonus() * calculate_health(1, gameMan.getLevel())))
		iDied()

func iDied():
	queue_free()
