extends RigidBody2D


export var speed = 400
var screen_size = Vector2.ZERO

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	position += direction * speed * delta
	
	if direction.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	
	if direction.x != 0: #When walking play a walking animation, when standing still, play a short idling animation
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = direction.x < 0
	else:		$AnimatedSprite.animation = "idle"
