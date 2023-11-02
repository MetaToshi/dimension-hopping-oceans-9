extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("walking")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


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

func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://mainscene.tscn")
