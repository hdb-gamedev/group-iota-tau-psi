extends AspectRatioContainer
export (Texture) var texture_x
export (Texture) var texture_o
onready var texture_Button = $"texture button"
var state = Logic.State.EMPTY setget set_state
func set_state (new_state):
	state = new_state
	if state == Logic.State.X:
		texture_Button.texture_normal = texture_x
		texture_Button.disabled = true
	if state == Logic.State.O:
		texture_Button.texture_normal = texture_o
		texture_Button.disabled = true
	if state == Logic.State.EMPTY:
		texture_Button.texture_normal = null
		texture_Button.disabled = false
func _on_texture_button_pressed():
	emit_signal ("pressed")
signal pressed
