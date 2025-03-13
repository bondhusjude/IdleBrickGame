extends Node
@export var gameMan: GameManager
@onready var Main = $".."
@onready var BallMan = Main.find_child("BallMan")
@onready var moneyLabel: Label = $"../FullScreen/Top_UI/VBoxContainer/Money"
@onready var crystalLabel: Label = $"../FullScreen/Top_UI/VBoxContainer/Crystal"
@onready var levelLabel: Label = $"../FullScreen/Top_UI/CenterContainer/Level"
@export var pathOfFolder = "res://Bricks/BrickFormations/"
@export var scene_count: int
@export var scene_files = []  # List to store scene filenames
@onready var ballSpawn = $"../BrickFormationMan/BallSpawn"

func _ready():
		scene_files = get_scene_files(pathOfFolder)
		scene_count = scene_files.size()  # Set scene count based on the number of files

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	moneyLabel.text = "Money: " + str(gameMan.getMoney())
	crystalLabel.text = "Crystal: " + str(gameMan.getCrystal())
	levelLabel.text = "Level: " + str(gameMan.getLevel())

func spawnBall(newBall: String):
	var ball = load(newBall)
	var new_ball = ball.instantiate()
	new_ball.global_position = ballSpawn.global_position
	BallMan.add_child(new_ball)

# Called when the end of the level happens
func _on_brick_formation_man_end_level() -> void:
	# add 1 to level count
	gameMan.addLevel()
	##TODO fix movement of balls so that they dont break half of the level when they are moved 
	for ball in BallMan.get_child_count():
		var child = BallMan.get_child(ball)
		child.global_position = ballSpawn.global_position
	#spawn new brick formatino under BrickFormationMan
	loadScene(pathOfFolder, randi_range(0, (1 - scene_count)))

# Load the scene dynamically
func loadScene(path: String, numberChoosen: int):
	if numberChoosen >= 0:
		var scene_name = path + scene_files[numberChoosen]  # Get the correct scene file from the list
		var scene = load(scene_name)  # Load the scene
		if scene:
			var instance = scene.instantiate()  # Instantiate the scene
			Main.find_child("BrickFormationMan").add_child.call_deferred(instance)  # Add it to the scene tree (or parent node)
		else:
			print("Failed to load scene: " + scene_name)
	else:
		print("Invalid scene index: " + str(numberChoosen))

# Get all the scene files from the folder
func get_scene_files(path: String) -> Array:
	var dir = DirAccess.open(path)
	var files = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".tscn"):  # Check if it's a scene file
				files.append(file_name)  # Add it to the files array
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("Failed to open directory: " + path)
		
	return files
