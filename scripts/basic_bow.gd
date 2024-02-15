extends Area2D

@export_group("Bow proprieties")
@export var basic_damage = 1
var enemies_in_range

func _physics_process(delta):
	enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		
		
func shoot():
	const PROJECTILE = preload("res://cenas/arrow.tscn")
	var new_bullet = PROJECTILE.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_arrow_timer_timeout():
	if(enemies_in_range.size() > 0):
		shoot()
		
func aumenta_dano():
	if basic_damage < 10: 
		basic_damage += 1
	print(basic_damage)

func aumenta_velocidade_tiro():
	if %ArrowTimer.wait_time > 0.20: 
		%ArrowTimer.wait_time -= 0.10
	print(%ArrowTimer.wait_time)
