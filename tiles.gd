extends Node2D
var tile = load("res://tile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(-5,10):
		for j in range(-5,10):
			var new_tile = tile.instantiate()
			new_tile.position = Vector2(i* 256,j*256)
			add_child(new_tile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
