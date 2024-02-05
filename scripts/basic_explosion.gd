extends Node2D

func _ready():
	%AnimationPlayer.play("explodiu_verde")
	await %AnimationPlayer.animation_finished
	queue_free()
