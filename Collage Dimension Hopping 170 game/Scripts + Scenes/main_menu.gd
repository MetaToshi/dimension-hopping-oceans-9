extends Node


func _on_startbutton_pressed():
	get_tree().change_scene_to_file("res://cutsceneINTRO.tscn")


func _on_optionsbutton_pressed():
	get_tree().change_scene_to_file("res://Scripts/options.tscn")



func _on_quitbutton_pressed():
	get_tree().quit()
