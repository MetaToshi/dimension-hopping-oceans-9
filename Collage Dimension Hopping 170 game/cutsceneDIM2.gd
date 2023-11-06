extends Node2D

var resource = load("res://Dialogue/DIMENSION1.dialogue")
var sprite1: Sprite2D
var sprite2: Sprite2D
var currentSprite : int = 1


func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/DIMENSION1.dialogue"), "this_is_a_node_title")
	sprite1 = $BeanieHeadshotSprite
	sprite2 = $FlowSprite
	sprite1.show()
	sprite2.hide()
#	var resource = preload("res://Dialogue/DIMENSION1.dialogue")
#	DialogueManager.show_example_dialogue_balloon(\
#		"this_is_a_node_title,", \
#		resource
#	)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		toggle_sprites()

func toggle_sprites():
	if currentSprite == 1:
		sprite1.hide()
		sprite2.show()
		currentSprite = 2
	else:
		sprite1.show()
		sprite2.hide()
		currentSprite = 1
	
func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://mainscene.tscn")

# code below is to connect the cutscenes and the main scene together	

#func switchToSceneInGroup(group_name: String, scene_name: String):
#	if group_exists(group_name):
#		var scene = group_get_scene(group_name, scene_name)
#		if scene:
#			get_tree().change_scene(scene)
#		else:
#			print("Scene not found in the group: ", scene_name)
#	else:
#		print("Group not found: ", group_name)
#
#func group_exists(group_name: String) -> bool:
#	return ProjectSettings.get_setting("application/run/resources/load_" + group_name) != null
#
#func group_get_scene(group_name: String, scene_name: String) -> String:
#	if group_exists(group_name):
#		var group = ProjectSettings.get_setting("application/run/resources/load_" + group_name)
#		if group.has(scene_name):
#			return group[scene_name]
#	return ""


