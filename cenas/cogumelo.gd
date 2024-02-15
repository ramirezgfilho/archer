extends Area2D

const TIPO_ITEM = "Cogumelo"

func _on_body_entered(body):
	
	queue_free()
