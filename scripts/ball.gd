extends Node2D

class_name Ball

@export var type: String
@export var rigidbody: RigidBody2D

func evolution(other: Ball):
	if type == other.type:
		var next: Ball
		match type:
			"apple": next = load("res://components/orange.tscn").instantiate() as Ball
			"orange": next = load("res://components/pair.tscn").instantiate() as Ball
			"pair": next = load("res://components/melon.tscn").instantiate() as Ball
			"melon": next = load("res://components/wmelon.tscn").instantiate() as Ball
		if next != null:
			get_parent().add_child(next)
			next.rigidbody.global_position = rigidbody.global_position
		queue_free()
		other.queue_free()
