extends CharacterBody2D

signal orc_morreu

var life = 3
#Aanotação usada que espera a árvore de nodes ser criada para ser executada
@onready var player = get_node("/root/Game/Player")
@onready var bow = get_node("/root/Game/Player/BasicBow")

#Define o processo de física
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position).normalized()
	velocity = direction * 50
	move_and_slide()
	#Armazenando na variável direction a posição do jogador.
	#De fato movendo mob
	
func _on_orc_mob_died():
	visible = not visible	

func take_damage():
	%AnimatedSprite2D.play("damage")
	life -= bow.basic_damage
	##%HurtAudio.playing = true
	##%Slime.play_hurt()
	
	if life <= 0:
		orc_morreu.emit()
		const BASIC_EXPLOSION = preload("res://cenas/basic_explosion.tscn")
		var explosion = BASIC_EXPLOSION.instantiate()
		get_parent().add_child(explosion)
		explosion.global_position = global_position
		queue_free()

		
# Tempo para o mob sumir do mapa.
##func _on_sumir_timer_timeout():
##	queue_free() 

func _on_animated_sprite_2d_animation_looped():
	%AnimatedSprite2D.play("default") # Replace with function body.
