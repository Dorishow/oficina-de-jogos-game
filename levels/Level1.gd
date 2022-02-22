extends Node2D

onready var redGoal = $environment/Goals/Red
onready var blueGoal = $environment/Goals/Blue
onready var redBox = $environment/boxes/redBox
onready var blueBox = $environment/boxes/blueBox

var winCondition = { 'red': false, 'blue': false}

var gameStatus = 'playing'

func _process(delta):
	winCondition.red = redGoal.position == redBox.position
	winCondition.blue = blueGoal.position == blueBox.position
	if winCondition.red and winCondition.blue:
		if gameStatus == 'playing':
			print("win")
			gameStatus = 'game over'
	
