extends RigidBody2D

var THRUSTER_FORCE := 10000.0

func _physics_process(delta: float) -> void:
	var thrusters := get_children().filter(func(child): return child is Thruster and child.enabled)
	for thruster: Thruster in thrusters:
		var direction = Vector2.UP.rotated(thruster.global_rotation).snappedf(0.001).normalized()
		var magnitude := THRUSTER_FORCE * delta
		var force = direction * magnitude
		var force_origin = thruster.position.rotated(rotation)
		apply_force(force, force_origin)
