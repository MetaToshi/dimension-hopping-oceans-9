extends CanvasLayer

var dialogue_res
var dialogue_line = {}

@onready var speaker = $bg/mc/vc/Speaker
@onready var dialogue_bg = $bg
@onready var dialogue_text = $bg/mc/vc/Text

var awaiting_selection = false
var total_characters = 0
var typing_dialogue = false
var characters_drawn = 0
var Y_scale = 0 
@export var DRAW_SPEED = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func start_dialogue(dialogue,start_point):
	dialogue_res = dialogue
	dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue)
	update_dialogue_window()


func update_dialogue_window():
	Y_scale = 0
	if dialogue_line.is_empty():
		return
	speaker.text = dialogue_line.character
	dialogue_text.text = dialogue_line.text
	Y_scale += speaker.get_content_height()
	Y_scale += dialogue_text.get_content_height()
	total_characters = dialogue_text.get_total_character_count()
	dialogue_text.visible_characters = 0
	characters_drawn = 0
	typing_dialogue = true


func end_dialogue():
	queue_free()
	
