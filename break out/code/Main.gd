extends Node

onready var Block_scene: PackedScene  = preload("res://code/Block.tscn")


onready var ball : Node = get_node("Ball")
onready var container : Node = get_node("container")
onready var panel : Node = get_node("Panel")
onready var anim : Node = get_node("Counter/AnimationPlayer")
onready var Score : Node = get_node("CanvasLayer/Score")

onready var gap : Vector2 = Vector2(16,16)
onready var block_size : Vector2 = Vector2(64,32)
onready var first_block_pos : Vector2 = Vector2(32,16)



func _ready() -> void:
	$Restart.visible = false
	spawn_blocks()
	anim.play("timer")
	yield(anim,"animation_finished")
	$Counter.queue_free()
	ball.visible = true
	start()
	
	
	
	

func _process(_delta: float) -> void:
	if Utils.game_over == true:
		game_over()
		
	if container.get_child_count() == 0 :
		game_over()
		
	Score.text = str(Utils.score)

func spawn_blocks():
	var new_pos := Vector2.ZERO
	for pos_y in range(7):
		new_pos.y = pos_y*block_size.y+gap.y*pos_y
		for pos_x in range(13):
			new_pos.x = pos_x*block_size.x + gap.x*pos_x
			var new_block = Block_scene.instance()
			new_block.position = new_pos
			container.add_child(new_block)

func start():
	panel.set_process(true)
	ball.set_physics_process(true)




func game_over():
	panel.set_process(false)
	ball.set_physics_process(false)
	$Restart.visible = true
	Utils.game_over = false
	
func _on_Restart_button_up() -> void:
	get_tree().reload_current_scene()
	Utils.score = 0
