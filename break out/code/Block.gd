extends Area2D


func _on_Block_body_entered(body: Node) -> void:
	if body.name == "Ball":
		AudioPlayer.block_audio.play()
		Utils.score += 1
		body.Direction.y *= -1
		queue_free()
