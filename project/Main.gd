extends Control
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
			button.anchor_left = column * 1.0/3
			button.anchor_right = column * 1.0/3 + 1.0/3
			button.anchor_top = row * 1.0/3
			button.anchor_bottom = row * 1.0/3 + 1.0/3
			button.connect ("pressed" , self, "on_button_pressed" , [button , row , column])
	grid = [[Logic.State.EMPTY, Logic.State.EMPTY, Logic.State.EMPTY] , [Logic.State.EMPTY, Logic.State.EMPTY, Logic.State.EMPTY] , [Logic.State.EMPTY, Logic.State.EMPTY, Logic.State.EMPTY]]
func on_button_pressed (button, row, column) :
	print (row , " " , column)
	button.state = turn
	grid [row] [column] = turn
	
	if turn == Logic.State.X:
		turn = Logic.State.O
	elif turn == Logic.State.O:
		turn = Logic.State.X
	print (grid)
var turn = Logic.State.X
