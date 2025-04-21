extends AudioStreamPlayer2D
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			print(str(self)+str(playing))
