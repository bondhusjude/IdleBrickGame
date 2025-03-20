extends Panel
@export var gameMan: GameManager
@export var ball: Ball

@onready var activebutton1 = $ActiveCards/HBoxContainer/ActiveButton1
@onready var activebutton2 = $ActiveCards/HBoxContainer/ActiveButton2
@onready var activebutton3 = $ActiveCards/HBoxContainer/ActiveButton3
@onready var activebutton4 = $ActiveCards/HBoxContainer/ActiveButton4
@onready var activebutton5 = $ActiveCards/HBoxContainer/ActiveButton5
@onready var activebutton6 = $ActiveCards/HBoxContainer/ActiveButton6

enum State { LOCKED, UNLOCKED }

@export var usable = []

func _ready() -> void:
	usable = [
		{"state": State.UNLOCKED, "object": activebutton1, "empty": "y"},
		{"state": State.LOCKED, "object": activebutton2, "empty": "y"},
		{"state": State.LOCKED, "object": activebutton3, "empty": "y"},
		{"state": State.LOCKED, "object": activebutton4, "empty": "y"},
		{"state": State.LOCKED, "object": activebutton5, "empty": "y"},
		{"state": State.LOCKED, "object": activebutton6, "empty": "y"},
	]

func _process(_delta: float) -> void:
	for i in usable:
		#update labels inside the buttons so that we know if they are unclocked or not
		i.get("object").find_child("Label").text = State.keys()[i.get("state")]

func unlockSlot(obj: Button):
	for i in usable: 
		if obj.name.to_lower() == i.get("object").name.to_lower():
			i["state"] = State.UNLOCKED
			#print("Slot unlocked:", obj.name)
			return
	push_error("Button not found:", obj.name)

func _on_ball_speed_pressed() -> void:
	pass # Replace with function body.


func _on_ball_power_pressed() -> void:
	pass # Replace with function body.


func _on_brick_cash_pressed() -> void:
	pass # Replace with function body.


func _on_stage_bonus_pressed() -> void:
	pass # Replace with function body.


func _on_max_balls_pressed() -> void:
	pass # Replace with function body.


func _on_stage_skip_pressed() -> void:
	pass # Replace with function body.


func _on_gold_brick_chance_pressed() -> void:
	pass # Replace with function body.


func _on_gold_brick_bonus_pressed() -> void:
	pass # Replace with function body.


func _on_laser_pressed() -> void:
	pass # Replace with function body.


func _on_active_button_1_pressed() -> void:
	if usable[0]["state"] == State.UNLOCKED:
		pass
	else:
		pass


func _on_active_button_2_pressed() -> void:
	if usable[1]["state"] == State.UNLOCKED:
		pass
	else:
		pass


func _on_active_button_3_pressed() -> void:
	if usable[2]["state"] == State.UNLOCKED:
		pass
	else:
		pass


func _on_active_button_4_pressed() -> void:
	if usable[3]["state"] == State.UNLOCKED:
		pass
	else:
		pass


func _on_active_button_5_pressed() -> void:
	if usable[4]["state"] == State.UNLOCKED:
		pass
	else:
		pass


func _on_active_button_6_pressed() -> void:
	if usable[5]["state"] == State.UNLOCKED:
		pass
	else:
		pass
