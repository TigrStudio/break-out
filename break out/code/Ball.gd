extends KinematicBody2D

var speed_multiplier : int = 10
var size : Vector2 = Vector2(16,16)
var max_speed : float = 400.0
export (Vector2) var Direction : Vector2 = Vector2(1,1)
export (float) var speed : float = 16*speed_multiplier





func _ready() -> void:
	position = Vector2(Utils.screen_size.x/2,Utils.screen_size.y/2 + size.y*4)
	set_physics_process(false)
	visible = false
	
func _physics_process(delta: float) -> void:
	var velocity := Vector2.ZERO
	speed = min(max_speed,(speed_multiplier+(Utils.score/4)) * 16)
	Direction = new_direction(Direction)
	velocity = Direction*speed
	
	position += velocity*delta
	#move_and_collide(velocity)
	
func new_direction(dir) -> Vector2:
	var new_dir = dir
	if position.x > (Utils.screen_size.x - size.x):
		new_dir.x *= -1
		AudioPlayer.wall_audio.play()
	elif position.x < size.x:
		new_dir.x *= -1
		AudioPlayer.wall_audio.play()
	if position.y > (Utils.screen_size.y - size.y):
		Utils.game_over = true
	elif position.y < size.x:
		new_dir.y *= -1
		AudioPlayer.wall_audio.play()
		
	return new_dir

func _on_collision_detector_body_entered(body: Node) -> void:
	if body.is_in_group("panel"):
		AudioPlayer.panel_audio.play()
		Direction.y *= -1

