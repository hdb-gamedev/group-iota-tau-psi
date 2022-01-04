extends AspectRatioContainer
export (Texture) var texture_x
export (Texture) var texture_o
onready var texture_Button = $"texture button"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_texture_button_pressed():
	texture_Button.texture_normal = texture_x
