extends Control
enum state {EMPTY, X, O}
var grid
var x_plays = true
onready var board = $AspectRatioContainer/TextureRect
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Button = preload ("res://button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready(): 
	for row in range (0,3) :
		for column in range (0,3) :
			var button = Button.instance()
			board.add_child(button)
			button.anchor_left = column * 0.333333333
			button.anchor_right = column * 0.333333333 + 0.33333333
			button.anchor_top = row * 0.333333333
			button.anchor_bottom = row * 0.33333333333 + 0.333333333
	grid = [state.EMPTY, state.EMPTY, state.EMPTY, state.EMPTY, state.EMPTY, state.EMPTY, state.EMPTY, state.EMPTY, state.EMPTY]
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
