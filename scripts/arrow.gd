extends Area2D

var travelled_distance = 0 

@export var arrow_speed = 300
@export	var arrow_distance_range = 1200

func _ready():
	##%AudioStreamPlayer2D.playing = true
	pass

func _physics_process(delta):
	%VentoDaFlecha.emitting = true
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * arrow_speed * delta 
	
	travelled_distance += arrow_speed * delta
	
	if travelled_distance > arrow_distance_range:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()

