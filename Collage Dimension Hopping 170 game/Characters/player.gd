extends CharacterBody2D

@export var speed : float = 600.0
@export var jump_velocity : float = -1150
var current_Restart = Vector2(0,200)


"""
func _ready() -> void:
	anim.play("idle")

func play_anim( animation_name ) -> void:
	anim.play( animation_name)

func stop_anim() -> void:
	anim.stop()
"""

func _ready():
	$DIM1PLAYER.play("run")
	$DIM1BGMUSIC.play()
	
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
	
	move_and_slide()
	
	#Working on making the chracter destroy stuff
func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		$Chara.play("attack")
		$FireSpell.play()
	if Input.is_action_just_pressed("Restart from Checkpoint"):
		respawn()
			
func respawn():
	position = current_Restart
	$Camera2D.position.x = current_Restart.x - 200
	$Camera2D.position.y = current_Restart.y - 500
	if current_Restart.y > 1000:
		$Camera2D.position.y = current_Restart.y - 5000
	
# Player entering through portal
func _on_area_2d_area_entered(area):
	# get_tree().change_scene_to_file("res://cutscene.tscn")
	if area.is_in_group("Portal"):
		$PLAYERDIM1.visible = false
		$PLAYERDIM2.visible = true
		$PLAYERDIM3.visible = false
		$Attacking/D1Attack.visible = false
		$Attacking/D2Attack.visible = true
		$ParallaxBackgroundDIM1.visible = false
		$ParallaxBackgroundDIM2.visible = true
		$DIM1BGMUSIC.stop()
		$DIM2BGMUSIC.play()
		position.x = 0
		position.y = 1500
		current_Restart.x = 0
		current_Restart.y = 2600
		speed = 775
		jump_velocity = -950
		
	if area.is_in_group("portal2"):
		$PLAYERDIM1.visible = false
		$PLAYERDIM2.visible = false
		$PLAYERDIM3.visible = true
		$Attacking/D2Attack.visible = false
		$Attacking/D3Attack.visible = true
		$ParallaxBackgroundDIM1.visible = false
		$ParallaxBackgroundDIM2.visible = false
		$DIM2BGMUSIC.stop()
		$DIM3BGMUSIC.play()
		# $ParallaxLayer1.parallax_scale = Vector2() # changes size
		position.x = 0
		position.y = 3000
		current_Restart.x = 0
		current_Restart.y = 6200
		gravity = 2000
		speed = 400
		jump_velocity = -1100
		
	if area.is_in_group("Portal3"):
		position.x = 3000
		position.y = 150
		
func _on_player_hurt_box_area_entered(area):
	if area.is_in_group("enemy"):
		respawn()
		
func _on_attacking_area_entered(area):
	if area.is_in_group("breakable"):
		var k = area.get_owner()
		k.position.y += 10000
		print(k.position)
		$Attacking.set_deferred("visible", false)
		$Attacking/CollisionShape2D.set_deferred("disabled", true)
	if area.is_in_group("enemy"):
		var k = area.get_owner()
		k.position.y += 10000
		$Attacking.set_deferred("visible", false)
		$Attacking/CollisionShape2D.set_deferred("disabled", true)
	pass


func _on_chara_animation_finished(_attack):
	$DIM1PLAYER.play("run")
	pass
