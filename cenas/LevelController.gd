extends Node

var score = 0
@export var level_timer = 0
@export var dificulty_level = 0

func _on_score_timer_timeout():
	aumenta_score(1)

func aumenta_score(valor):
	score += valor
	
func _physics_process(delta):
	%Score.set_text(str(score))
	%Timer.set_text(str(level_timer))

func _on_game_timer_timeout():
	level_timer += 1
	if(%MobTimer.wait_time > 0.6):
		if(level_timer % 60 == 0):
			diminui_tempo_mob()	

func diminui_tempo_mob():
	%MobTimer.wait_time -= 0.10
	print("Tempo de spawn: ", %MobTimer.wait_time)
