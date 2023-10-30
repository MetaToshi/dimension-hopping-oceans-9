extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		$PauseMenu.visible = true
		$PauseMenu.position = $Player.position
		$PauseMenu.position.y -= 200
		$PauseMenu.position.x -= 50
		get_tree().paused = true
		
		
func _on_back_to_game_pressed():
	get_tree().paused = false
	$PauseMenu.visible = false


func _on_back_to_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scripts/main_menu.tscn")


func _on_controls_pressed():
	$ControlMenuX.position = $PauseMenu.position
	$ControlMenu.position = $PauseMenu.position
	$ControlMenu.position.y += 100
	$ControlMenu.position.x += 325
	$ControlMenuX.visible = true
	$ControlMenu.visible = true
	


func _on_control_menu_x_pressed():
	$ControlMenuX.visible = false
	$ControlMenu.visible = false
