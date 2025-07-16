extends RigidBody2D

func _process(_delta: float) -> void:
	var viewport_size = get_viewport_rect().size

	var center = viewport_size / 2
	var out_of_bounds = position.x < 0 or position.x > viewport_size.x or position.y < 0 or position.y > viewport_size.y
	if out_of_bounds or Input.is_action_just_pressed("reset_ship"):
		position = center
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
		rotation = 0.0
		print("Ship reset to center due to out of bounds position.")

func _physics_process(delta: float) -> void:
	var thrusters := get_children().filter(func(child): return child is Thruster and child.enabled)
	for thruster: Thruster in thrusters:
		var direction = Vector2.UP.rotated(thruster.global_rotation).snappedf(0.001).normalized()
		var magnitude = 2000 * delta
		var force = direction * magnitude
		apply_force(force, -thruster.position.rotated(thruster.global_rotation).snappedf(0.001))
