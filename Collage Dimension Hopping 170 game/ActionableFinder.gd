extends StaticBody2D

@onready var actionable_finder: Area2D = $Marker2D/ActionableFinder
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _unhandled_input(event_: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 8:
			actionables[0].action()
			return
