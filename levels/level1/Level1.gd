extends Node2D

onready var redGoal = $environment/Goals/Red
onready var blueGoal = $environment/Goals/Blue
onready var redBox = $environment/boxes/redBox
onready var blueBox = $environment/boxes/blueBox
onready var dialog = $CanvasLayer/GUI/AcceptDialog

var levels = [
	"res://levels/level1/Level1.tscn", 
	"res://levels/level2/Level2.tscn",
	"res://levels/level3/Level3.tscn",
	"res://levels/level4/Level4.tscn",
	"res://levels/level2/Level2.tscn",
	]

func _ready():
	dialog.connect("confirmed", self, "on_confirmed")
	pass

var winCondition = { 'red': false, 'blue': false}

var gameStatus = 'playing'

func _process(delta):
	winCondition.red = redGoal.position == redBox.position
	winCondition.blue = blueGoal.position == blueBox.position
	if winCondition.red and winCondition.blue:
		if gameStatus == 'playing':
			winGame()

func winGame():
	print("win")
	gameStatus = 'game over'
	dialog.popup()
	
	
func on_confirmed():
	var currentPath = get_tree().get_current_scene().filename
	var indexOfCurrentPath = levels.find(currentPath, 0)
	if indexOfCurrentPath + 1 < levels.size():
		get_tree().change_scene(levels[indexOfCurrentPath + 1])
	else:
		print('Game over, all levels are clear')
	pass
