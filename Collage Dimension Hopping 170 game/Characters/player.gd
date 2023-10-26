extends CharacterBody2D

@export var speed : float = 500.0
@export var jump_velocity : float = -1000


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	#Make character move
	velocity.x = speed
	if velocity.x <= speed:
		pass
	
	move_and_slide()
	
	#Working on making the chracter destroy stuff
func attack():
	if Input.is_action_just_pressed("attack"):
		pass
func _on_attacking_area_entered(area):
	if area.is_in_group("breakable"):
		area.destroy()

# Player entering through portal
func _on_area_2d_area_entered(area):
	if area.is_in_group("Portal"):
		position.x = 0
		position.y = 1000
