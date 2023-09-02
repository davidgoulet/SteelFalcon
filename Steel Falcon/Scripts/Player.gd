extends CharacterBody2D

@export var ActivePlayer = false
@export var Speed = 600.0
@export var Acceleration = 800.0
@export var JumpVelocity = -400.0
@export var Friction = 1200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):

	var input_axis = Input.get_axis("move_left", "move_right")
	
	apply_gravity(delta)
	handle_jump()
	apply_friction(input_axis, delta)
	handle_acceleration(input_axis, delta)
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JumpVelocity
	else:
		$AnimatedSprite2D.play("Jumping")
		if Input.is_action_just_released("jump") and velocity.y < JumpVelocity / 2:
			velocity.y = JumpVelocity / 2

func apply_friction(input_axis, delta):
	if is_on_floor():
		if input_axis == 0:
			velocity.x = move_toward(velocity.x, 0, Friction * delta)
			$AnimatedSprite2D.play("Standing")

func handle_acceleration(input_axis, delta):
	if input_axis:
		if input_axis == -1:
			$AnimatedSprite2D.flip_h = true
		if input_axis == 1: 
			$AnimatedSprite2D.flip_h = false
		velocity.x = move_toward(velocity.x, Speed * input_axis, Acceleration * delta)
		if is_on_floor():
			$AnimatedSprite2D.play("Moving")