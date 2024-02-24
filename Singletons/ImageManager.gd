extends Node

var _item_images:Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	_load_item_images()
	print("Images loaded: %s" % _item_images.size())

# reads entire folder - then calls _load_valid_image to confirm
# file is a valid image and adds it to the image dictionary
func _load_item_images():
	const path="res://assets/glitch"
	var dir = DirAccess.open(path)
	
	if not dir:
		print("Error loading images")
		return

	# load only image files
	for fn in dir.get_files():
		_load_valid_image(fn, path)


func _load_valid_image(filename:String, path:String):
	const valid_image_types = [
		".jpg",
		".png",
		".gif",
		".bmp",
		".svg",
		".ico",
		".webp"
	]
	
	# make sure there is a trailing / on path
	if not path.ends_with("/"):
		path = path + "/"
	
	for file_type in valid_image_types:
		if filename.to_lower().ends_with(file_type):
			
			# we have a valid image file
			# add it to image dictionary array
			var ii_dict = {
				"item_name": filename.rstrip(file_type),
				"item_texture": load(path + filename)
			}
			_item_images.append(ii_dict)


func get_random_image() -> Dictionary:
	return _item_images.pick_random()
	


