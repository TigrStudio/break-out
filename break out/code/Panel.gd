#Panel script
extends KinematicBody2D

onready var mouse_pos:Vector2

export (Vector2) var size  : Vector2 = Vector2(128,32)
export (int)     var speed : int = 50


func _ready() -> void:
	position = Vector2(Utils.screen_size.x/2,Utils.screen_size.y - size.y*2)
	set_process(false)

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	mouse_pos = get_global_mouse_position()
	velocity = mouse_pos - position
	position.x += velocity.x*speed*delta
	position.x = clamp(position.x,size.x/2,Utils.screen_size.x- size.x/2)
