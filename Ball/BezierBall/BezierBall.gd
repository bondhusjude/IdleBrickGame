extends CharacterBody2D
@export var ball: Ball

const bezier = preload("res://Ball/BezierBall/bezierCurve.tres")
@onready var sprite: Polygon2D = $Polygon2D

# Direction of movement (normalized vector)
var direction: Vector2 = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
# damage is necasary so we can call damage in the script BasicBrick.gd
var damage
@onready var explode: CPUParticles2D = $explode


@onready var speed_multiplier = 0.0
func _physics_process(delta: float) -> void:
	
	# Calculate the movement vector
	var _velocity: Vector2 = direction * ball.getSpeed()
	damage = ball.getDamage()
	# Move the ball and handle collisions
	speed_multiplier = fmod(speed_multiplier + delta, 1.0)
	
	
	var collision: KinematicCollision2D = move_and_collide(_velocity * delta * bezier.sample(speed_multiplier))
	# If a collision occurs, bounce the ball
	if collision:
		if collision.get_collider() == StaticBody2D:
			direction = direction.bounce((collision.get_normal() + Vector2(roll_nonzero(), roll_nonzero())).normalized())
		var new_explode = explode.duplicate()
		add_child(new_explode)
		new_explode.emitting = true
		direction = direction.bounce(collision.get_normal())

		
	
	manage_sprite(delta, _velocity,speed_multiplier)

var old_pos = Vector2.ZERO
func manage_sprite(delta, _velocity,speed_multiplier):
	var speed_scale = bezier.sample(speed_multiplier)
	var new_vel = (global_position - old_pos) / delta
	old_pos = global_position
	sprite.scale.x = 1 + speed_scale
	sprite.scale.y = 1 - (speed_scale * .2)
	sprite.rotation = new_vel.normalized().angle()
	
func roll_nonzero() -> int:
	var value = 0
	while value == 0:
		value = randi_range(-1, 1)
	return value
