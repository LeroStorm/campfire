extends CharacterBody2D

var hp = 100

const SPEED = 300.0


func _physics_process(_delta):
	$ProgressBar.value = hp
	
	velocity = Vector2(0,0)
	for body in $"interact area".get_overlapping_bodies():
		if Input.is_action_just_pressed("enteract"):
			body.interact()
		body.modulate = Color(1, 0.8, 0.77, 1)
		
	
	if Input.is_action_pressed("right"):
		velocity.x += SPEED
		$EmoGoat.flip_h = true
	if Input.is_action_pressed("left"):
		velocity.x -= SPEED
		$EmoGoat.flip_h = false
		
	if Input.is_action_pressed("up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("down"):
		velocity.y += SPEED
		

	move_and_slide()


func _on_interact_area_body_exited(body):
	body.modulate = Color(1, 1, 1, 1)
	
	
func dmged(dmg):
	hp -= dmg
	modulate = Color(1, 0.8, 0.77, 1)
	await get_tree().create_timer(1).timeout
	modulate = Color(1, 1, 1, 1)
	


func _on_progress_bar_value_changed(_value):
	$ProgressBar.visible = true
	await get_tree().create_timer(1).timeout
	$ProgressBar.visible = false
