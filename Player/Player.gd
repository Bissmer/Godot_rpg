extends KinematicBody2D

const FRICTION = 10
const ACCELERATION = 10
const MAX_SPEED = 100

#var that repsenets the change of x.y position
var velocity = Vector2.ZERO

#move char
#we create a funftion for physics conut per tic and create input vector var that
#is equal 0 by default
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#we normalize vector to make diagonal moving the same speed as the hor or vertical
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_collide(velocity)
   
