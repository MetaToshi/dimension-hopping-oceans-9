extends Node

signal npc(jump)
signal my_signal
func jump_character(_name):
	npc_jump.emit(_name)

func _ready():
	my_signal.connnect(test)
	
	
func test(v):
	print(v)
