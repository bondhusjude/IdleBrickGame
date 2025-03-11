extends Control

@export var basicBall: Ball
@onready var gameMan = $"../../../../GameManager"

## Basic Ball
func _on_plus_ball_pressed() -> void:
	gameMan.spawnBall("res://Ball/BasicBall/basic_ball.tscn")

## Basic Ball
func _on_power_pressed() -> void:
	basicBall.setDamage(basicBall.getDamage() + 1) 

## Basic Ball
func _on_speed_pressed() -> void:
	basicBall.setSpeed(basicBall.getSpeed() + 10)
