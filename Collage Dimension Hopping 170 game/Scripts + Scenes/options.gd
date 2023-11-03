extends Node2D



func _on_button_pressed():
	$VBoxContainer/Description.visible = false
	$Button.visible = false


func _on_sound_pressed():
	pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scripts/main_menu.tscn")


func _on_controls_pressed():
	$VBoxContainer/Description.visible = true
	$Button.visible = true
