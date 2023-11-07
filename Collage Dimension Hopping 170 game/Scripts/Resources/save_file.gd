extends Node

var save_path = "user://variable.save"

var positionx = 0
var positiony = 0

func _on_area_2d_area_entered(area):
	save()
	

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_string(positionx)
		file.store_string(positiony)
		file.close()
		print("it saved!")
#	file.open(SAVE_FILE, file.WRITE)
#	file.store_var(g_data)
#	file.close()


func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
	else:
		print("no data saved...")
