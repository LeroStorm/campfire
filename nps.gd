extends CharacterBody2D
var target = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta):

	if target:
		velocity =  target.position - position
	else:
		velocity = Vector2(0,0)
	move_and_slide()


func _on_zone_find_player_body_entered(body):
	target = body


func _on_zone_find_player_body_exited(_body):
	target = false


func _on_zone_dmg_player_body_entered(body):
	body.dmged(5)
