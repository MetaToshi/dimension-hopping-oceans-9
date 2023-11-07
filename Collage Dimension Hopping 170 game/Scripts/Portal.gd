extends Sprite2D

var SAVE_FILE = "user://save_file.save"
var g_data = {}


func save():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	print("it saved!")


func load_data():
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	else:
		print("no data saved...")
