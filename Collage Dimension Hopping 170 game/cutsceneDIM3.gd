extends Node2D

var resource = load("res://Dialogue/DIMENSION3.dialogue")
var sprite1: Sprite2D
var sprite2: Sprite2D
var currentSprite : int = 1


func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/DIMENSION3.dialogue"), "this_is_a_node_title")
	sprite1 = $BeanieSprite
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
