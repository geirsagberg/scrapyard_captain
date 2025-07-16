class_name Thruster
extends Sprite2D

var enabled := false:
	set(value):
		if value != enabled:
			enabled = value
			$GPUParticles2D.emitting = value

var last_force: Vector2 = Vector2.ZERO
var last_force_pos: Vector2 = Vector2.ZERO

const DEBUG_FORCE_SCALE := 1.0

@export var action: String = ""

func _ready() -> void:
	$GPUParticles2D.emitting = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(action):
		enabled = true
	elif Input.is_action_just_released(action):
		enabled = false
