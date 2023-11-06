extends Area2D

@export var Dialogue: DialogueResource
@export var dialogue_start: String = "start"
@export var _name = ""

var resource = load("res://Dialogue/DIMENSION1.dialogue")

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(Dialogue, dialogue_start)
