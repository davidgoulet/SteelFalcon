extends CharacterBody2D

@export var ActivePlayer = false
@export var Speed = 300.0
@export var JumpVelocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JumpVelocity

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)

	move_and_slide()
