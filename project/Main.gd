extends Control
var grid
var x_plays = true
onready var board = $AspectRatioContainer/TextureRect
var winner = Logic.State.EMPTY
const Button = preload ("res://button.tscn")
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
	#print (row , " " , column)
	button.state = turn
	grid [row] [column] = turn
	if win (row, column) :
		$CenterContainer.visible = true
		if turn == Logic.State.X :
			$CenterContainer/Label.text = "X Wins"
			winner = Logic.State.X
		if turn == Logic.State.O :
			$CenterContainer/Label.text = "O Wins"
			winner = Logic.State.O
	if tie () :
		$CenterContainer.visible = true
		$CenterContainer/Label.text = "Tie"
		winner = Logic.State.EMPTY
	if turn == Logic.State.X:
		turn = Logic.State.O
	elif turn == Logic.State.O:
		turn = Logic.State.X
	#print (grid)
var turn = Logic.State.X
func win (column, row) :
	print (row, column)
	if grid [0] [row] == grid [1] [row] and grid [1] [row] == grid [2] [row] :
		return true
	if grid [column] [0] == grid [column] [1] and grid [column] [1] == grid [column] [2] :
		return true
	if grid [0] [0] == grid [1] [1] and grid [1] [1] == grid [2] [2] and grid [0] [0] != Logic.State.EMPTY :
		return true
	if grid [2] [0] == grid [1] [1] and grid [1] [1] == grid [0] [2] and grid [2] [0] != Logic.State.EMPTY :
		return true
	return false
func tie () :
	for x in range (0, 3) :
		for y in range (0, 3) :
			if grid [x] [y] == Logic.State.EMPTY :
				return false
	return true
func _on_ResetButton_pressed():
	for x in range (0, 3) :
		for y in range (0, 3) :
			grid [x] [y] = Logic.State.EMPTY
	if winner == Logic.State.X :
		turn = Logic.State.X
	if winner == Logic.State.O :
		turn = Logic.State.O
	# if the last game was a tie, then whoever would go next still goes next.
	$CenterContainer.visible = false
	for node in board.get_children () :
		node.set_state (Logic.State.EMPTY)
