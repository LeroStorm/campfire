extends Node
var nps = load("res://nps.tscn")


func _ready():
	await get_tree().create_timer(3).timeout
	while $Logo.modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		$Logo.modulate.a -= 0.01
	spawn(nps, Vector2(0,0))


func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()


func spawn(body, pos):
	var spawned_body = body.instantiate()
	spawned_body.position = pos
	$spawned.add_child(spawned_body)
