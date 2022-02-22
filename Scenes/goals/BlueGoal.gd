extends Area2D

var occupied = false

signal blueEntered
signal blueExited

func _on_Blue_body_entered(body):
	print('body entered on blue goal')
#	emit_signal("blueEntered")
	pass

func _on_Blue_body_exited(body):
	print('body exited on blue goal')
#	emit_signal("blueExited")
	pass
