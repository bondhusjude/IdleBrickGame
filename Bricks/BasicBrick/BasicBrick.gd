extends Area2D
@export var brick: Brick
@onready var statBody = $StaticBody2D
@onready var label = $Label
@export var gameMan: GameManager

func _ready():
	if brick:
		brick = brick.duplicate(true)
		label.text = str(brick.getHealth())

func _on_body_entered(body: Node2D) -> void:
	if body.get_class() == "CharacterBody2D":  # Alternative to `is Ball`
		var received_damage = body.damage
		if brick.getHealth() > received_damage:
			#seperate from ball class so call is by variable since its from BasicBall.gd script
			brick.healthMinus(received_damage)
			gameMan.addMoney(received_damage)
		else:
			gameMan.addMoney(brick.getHealth())
			iDied()
		label.text = str(brick.health)


func iDied():
	queue_free()
