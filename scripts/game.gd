extends Node2D

@onready var player = get_node("Player")
@onready var bow = get_node("Player/BasicBow")
@onready var arrow = get_node("Arrow")

func spawn_mob():
	var new_mob = preload("res://cenas/orc.tscn").instantiate()
	%PathFollow2DAreaOne.progress_ratio = randf()
	new_mob.global_position = %PathFollow2DAreaOne.global_position
	add_child(new_mob)
	
func spawn_cogumelo():
	var new_cog = preload("res://cenas/cogumelo.tscn").instantiate()
	%CogumeloPosi1.progress_ratio = randf()
	new_cog.global_position = %CogumeloPosi1.global_position
	add_child(new_cog)
	

func _physics_process(delta):
	%PlayerHealth.value = player.health
	%PlayerStamina.value = player.stamina

func _on_mob_timer_timeout():
	spawn_mob()

func _on_pause_button_pressed():
	%PauseScreen.visible = true
	%PauseButton.visible = false
	get_tree().paused = true
	
func _on_continue_button_pressed():
	get_tree().paused = false
	%PauseScreen.visible = false
	%PauseButton.visible = true

func _on_restart_game_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_exit_game_button_pressed():
	get_tree().quit()

func _on_player_vida_terminou():
	%GameOverScreen.visible = true
	%PauseButton.visible = false
	get_tree().paused = true

func _on_child_exiting_tree(orc):
	%LevelController.aumenta_score(5)


func _on_cogumelo_timer_timeout():
	spawn_cogumelo()


func _on_attack_pressed():
	bow.aumenta_dano()


func _on_velocidade_pressed():
	bow.aumenta_velocidade_tiro()
