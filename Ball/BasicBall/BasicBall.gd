extends CharacterBody2D
@export var ball: Ball
var damage = 0
# Direction of movement (normalized vector)
var direction: Vector2 = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _physics_process(delta: float) -> void:
	# Calculate the movement vector
	var _velocity: Vector2 = direction * ball.getSpeed()
	damage = ball.getDamage()
	# Move the ball and handle collisions
	var collision: KinematicCollision2D = move_and_collide(_velocity * delta)
	# If a collision occurs, bounce the ball
	if collision:
		if collision.get_collider() == StaticBody2D:
			direction = direction.bounce((collision.get_normal() + Vector2(roll_nonzero(), roll_nonzero())).normalized())
		direction = direction.bounce(collision.get_normal())

func roll_nonzero() -> int:
	var value = 0
	while value == 0:
		value = randi_range(-1, 1)
	return value
