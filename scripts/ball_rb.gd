extends RigidBody2D

class_name BallRigidBody

@export var ball: Ball

func _on_body_entered(body):
	if body is BallRigidBody:
		if body.ball.rigidbody.freeze : return
		if body.ball.name < ball.name : return
		body.ball.evolution(ball)

func _on_body_exited(body):
	pass
