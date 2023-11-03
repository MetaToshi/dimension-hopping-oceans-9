extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#MOVED ALL OF THE BELOW INTO PLAYER (IN THE SECTION OF ON AREA 2D ENTERED)
#func _on_Portal_area_entered(area):
#	print(area)
#		var k = area.get_owner()
#		print(k)
#		k.texture=ResourceLoader.load("res://TestAssets/testFloorTile.png")
		
#func _on_Portal_area_exited(area):
#	print(area)
#	if area.is_in_group("player"):
#		var k = area.get_owner()
#		print(k)
#		k.texture=ResourceLoader.load("res://TestAssets/testFloorTile.png")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
