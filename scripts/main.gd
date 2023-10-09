extends Node2D

@export var next_items: Node2D
@export var stock_items: Node2D

var next = null

func _ready():
	create_new_item()

func _process(delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			print("KEY_SPACE was pressed")
			pressed_space()
		if event.keycode == KEY_RIGHT:
			print("KEY_RIGHT was pressed")
			next_items.move_local_x(10)
		if event.keycode == KEY_LEFT:
			print("KEY_LEFT was pressed")
			next_items.move_local_x(-10)

func _physics_process(delta):
	pass

func create_new_item():
	match randi_range(1, 3):
		1: next = preload("res://components/apple.tscn").instantiate()
		2: next = preload("res://components/orange.tscn").instantiate()
		3: next = preload("res://components/pair.tscn").instantiate()
		4: next = preload("res://components/melon.tscn").instantiate()
		5: next = preload("res://components/wmelon.tscn").instantiate()
	next.rigidbody.freeze = true
	next_items.add_child(next)
	print(next)

func pressed_space():
	for child in next_items.get_children():
		child.reparent(stock_items)
		child.move_local_y(10)
		child.rigidbody.freeze = false
	create_new_item()
