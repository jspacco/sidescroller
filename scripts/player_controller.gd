extends KinematicBody2D

var walk_speed : int = 200
var run_speed : int = 300

var jump_speed : int =  150
var gravity : int = 200
var velocity = Vector2()

onready var _animated_sprite = $AnimatedSprite

func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += walk_speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= walk_speed
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y -= jump_speed
	# gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func _physics_process(delta):
	get_input(delta)
	

func _process(delta):
	var anim = "walk"
	if !is_on_floor():
		anim = "jump"
	if Input.is_action_pressed("move_right"):
		_animated_sprite.flip_h = false
		_animated_sprite.play(anim)
	elif Input.is_action_pressed("move_left"):
		_animated_sprite.flip_h = true
		_animated_sprite.play(anim)
	#elif Input.is_action_pre
	else:
		_animated_sprite.stop()
