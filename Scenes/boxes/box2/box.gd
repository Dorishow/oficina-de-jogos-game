extends KinematicBody2D

onready var ray = $RayCast2D

const gridSize = 16

var inputs = {
	'ui_up': Vector2.DOWN,
	'ui_down': Vector2.UP,
	'ui_right': Vector2.LEFT,
	'ui_left': Vector2.RIGHT,
}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var vectorPosition = inputs[dir] * gridSize
	ray.cast_to= vectorPosition
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vectorPosition
	else:
		print('colide with the wall')
	
