extends Control

onready var main_scene : PackedScene = preload("res://code/Main.tscn")


func _on_Button_button_up() -> void:
	get_tree().change_scene_to(main_scene)


func _on_Credit_pressed() -> void:
	$Button.visible = false
	$Credit.visible = false
	$Label.visible = true
	$Back.visible = true


func _on_Back_pressed() -> void:
	$Button.visible = true
	$Credit.visible = true
	$Label.visible = false
	$Back.visible = false
