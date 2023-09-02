extends CharacterBody2D

@export var ActivePlayer = false
@export var Speed = 400.0
@export var Acceleration = 800.0
@export var JumpVelocity = -400.0
@export var Friction = 1400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JumpVelocity
	else:
		$AnimatedSprite2D.play("Jumping")
		if Input.is_action_just_released("jump") and velocity.y < JumpVelocity / 2:
			velocity.y = JumpVelocity / 2

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		if direction == 1: 
			$AnimatedSprite2D.flip_h = false
		velocity.x = move_toward(velocity.x, Speed * direction, Acceleration * delta)
		if is_on_floor():
			$AnimatedSprite2D.play("Moving")
	else:
		velocity.x = move_toward(velocity.x, 0, Friction * delta)
		if is_on_floor():
			$AnimatedSprite2D.play("Standing")
			
	move_and_slide()
