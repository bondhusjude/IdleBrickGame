extends Panel
@export var gameMan: GameManager
@export var basic_ball: Ball

@onready var activebutton1 = $ActiveCards/HBoxContainer/ActiveButton1
@onready var activebutton2 = $ActiveCards/HBoxContainer/ActiveButton2
@onready var activebutton3 = $ActiveCards/HBoxContainer/ActiveButton3
@onready var activebutton4 = $ActiveCards/HBoxContainer/ActiveButton4
@onready var activebutton5 = $ActiveCards/HBoxContainer/ActiveButton5
@onready var activebutton6 = $ActiveCards/HBoxContainer/ActiveButton6

enum State { LOCKED, UNLOCKED }

@export var usable = []

func _ready() -> void:
	activebutton1.pressed.connect(on_active_button_pressed.bind(0))
	activebutton2.pressed.connect(on_active_button_pressed.bind(1))
	activebutton3.pressed.connect(on_active_button_pressed.bind(2))
	activebutton4.pressed.connect(on_active_button_pressed.bind(3))
	activebutton5.pressed.connect(on_active_button_pressed.bind(4))
	activebutton6.pressed.connect(on_active_button_pressed.bind(5))
	
	usable = [
		{"state": State.LOCKED, "object": activebutton1, "empty": true, "effect": null},
		{"state": State.LOCKED, "object": activebutton2, "empty": true, "effect": null},
		{"state": State.LOCKED, "object": activebutton3, "empty": true, "effect": null},
		{"state": State.LOCKED, "object": activebutton4, "empty": true, "effect": null},
		{"state": State.LOCKED, "object": activebutton5, "empty": true, "effect": null},
		{"state": State.LOCKED, "object": activebutton6, "empty": true, "effect": null},
	]

func _process(_delta: float) -> void:
	for i in usable:
		var label = i.get("object").find_child("Label")
		if label:
			var effect_name = "None"
			if i.get("effect"):
				var effect_str = str(i.get("effect"))
				var parts = effect_str.split("::")
				if parts.size() > 1:
					effect_name = parts[1]  # Extract function name
			label.text = State.keys()[i.get("state")] + "\n" + effect_name
		if not i.get("empty") and i.get("effect"):
			i.get("effect").call(true)

func unlockSlot(obj: Button):
	for i in usable: 
		if obj.name.to_lower() == i.get("object").name.to_lower():
			i["state"] = State.UNLOCKED
			#print("Slot unlocked:", obj.name)
			return
	push_error("Button not found:", obj.name)

func canPay(price: int) -> bool:
	return gameMan.getCrystal() >= price

func on_active_button_pressed(index: int) -> void:
	if usable[index]["state"] == State.UNLOCKED:
		usable[index]["state"] = State.UNLOCKED
		usable[index]["empty"] = true
		#set that function to call false so we dont have to call everyframe, then stop calling it entirely
		usable[index]["effect"].call(false)
		usable[index]["effect"] = null
	else:
		#index is a parrelle array to the index of the button that is pressed, 
		##first button price is 0 index
		var price = [1, 1, 1, 1, 1, 1][index]
		if canPay(price):
			gameMan.removeCrystal(price)
			usable[index]["state"] = State.UNLOCKED
			usable[index]["empty"] = true
		else:
			print("Can't Pay")

func checkForOpening(function):
	for i in usable:
		if i["state"] == State.UNLOCKED and i["empty"] == true:
			i["effect"] = function
			i["empty"] = false
			print("Effect applied to slot:", i.get("object").name)
			return
	print("No unlocked and empty slots available.")

func _on_ball_speed_pressed() -> void:
	checkForOpening(ballSpeedFunction)

func _on_ball_power_pressed() -> void:
	checkForOpening(ballPowerFunction)

func _on_brick_cash_pressed() -> void:
	checkForOpening(stageBonusFunction)

func _on_stage_bonus_pressed() -> void:
	checkForOpening(stageBonusFunction)

func _on_max_balls_pressed() -> void:
	checkForOpening(maxBallsFunction)

func _on_stage_skip_pressed() -> void:
	checkForOpening(stageSkipFunction)

func _on_gold_brick_chance_pressed() -> void:
	checkForOpening(goldBrickChanceFunction)

func _on_gold_brick_bonus_pressed() -> void:
	checkForOpening(goldBrickBonusFunction)

func _on_laser_pressed() -> void:
	checkForOpening(laserFunction)

func ballSpeedFunction(active: bool):
	if active:
		if not basic_ball.getDoubleSpeedC():
			basic_ball.setDoubleSpeedC(true)
	else:
		basic_ball.setDoubleSpeedC(false)

func ballPowerFunction(active: bool):
	if active:
		if not basic_ball.getDoubleDamageC():
			basic_ball.setDoubleDamageC(true)
	else:
		basic_ball.setDoubleDamageC(false)

## Boost the value of all bricks
func brickCashFunction(active: bool):
	if active:
		if not gameMan.getMoneyIncrease():
			gameMan.setMoneyIncrease(true)
	else:
		gameMan.setMoneyIncrease(false)

func stageBonusFunction(active: bool):
	if active:
		if not gameMan.getStageIncrease():
			gameMan.setStageIncrease(true)
	else:
		gameMan.setStageIncrease(false)

func maxBallsFunction(active: bool):
	if active:
		pass
	else:
		pass

func stageSkipFunction(active: bool):
	if active:
		if not gameMan.getStageSkip():
			gameMan.setStageSkip(true)
	else:
		gameMan.setStageSkip(false)

## TODO Need to finish implementing the rest of the cards
func goldBrickChanceFunction(active: bool):
	if active:
		pass
	else:
		pass

func goldBrickBonusFunction(active: bool):
	if active:
		pass
	else:
		pass

func laserFunction(active: bool):
	if active:
		pass
	else:
		pass
