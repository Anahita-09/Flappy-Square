extends CharacterBody2D

const FLAP = -200
const MAXFALLSPEED = 200
const GRAVITY = 10

var score = 0

func _physics_process(delta):
	velocity.y += GRAVITY
	
	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("FLAP"):
		velocity.y = FLAP
	
	move_and_slide()
	
	get_parent().get_parent().get_node("CanvasLayer/RichTextLabel").text = str(score)

func _on_detect_area_entered(area: Area2D) -> void:
	if area.name == "PointArea":
		score += 1

func _on_detect_body_entered(body: Node2D) -> void:
	if body.name == "Walls":
		call_deferred("_reload_scene")

func _reload_scene():
	get_tree().reload_current_scene()
