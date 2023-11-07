extends Node2D

@onready var breakables = get_tree().get_nodes_in_group("breakableparent")

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		$PauseMenu.visible = true
		$PauseMenu.position = $Player.position
		$PauseMenu.position.y -= 225
		$PauseMenu.position.x -= 50
		get_tree().paused = true
	if $Player.position.x <= 100:
		print($Player.position)
		for i in breakables:
			if i.position.y >= 8800:
				i.position.y -= 10000
	if Input.is_action_just_pressed("Restart from Checkpoint"):
		for i in breakables:
			if i.position.y >= 8800:
				i.position.y -= 10000
		pass
		
		
func _on_back_to_game_pressed():
	get_tree().paused = false
	$PauseMenu.visible = false


func _on_back_to_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scripts/main_menu.tscn")


func _on_controls_pressed():
	$ControlMenuX.position = $PauseMenu.position
	$ControlMenu.position = $PauseMenu.position
	
	$ControlMenu.position.y -= 90
	$ControlMenu.position.x += 310
	
	$ControlMenuX.position.y -= 190
	$ControlMenuX.position.x += 655
	
	$ControlMenuX.visible = true
	$ControlMenu.visible = true
	


func _on_control_menu_x_pressed():
	$ControlMenuX.visible = false
	$ControlMenu.visible = false


func _on_reload_checkpoint_pressed():
	get_tree().paused = false
	$PauseMenu.visible = false
	$Player.respawn()
	for i in breakables:
		if i.position.y >= 10000:
			i.position.y -= 10000

