extends CharacterBody2D
@export var bullet_scene: PackedScene
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var pos_bullet: Node2D
var status_shoot: bool
var time_shoot: float
var speed_shoot: float = 0.2

func _process(delta: float) -> void:
	

	
	if GameMagager.blood < 1:
		queue_free()
		
	if time_shoot > 0:
		time_shoot -= delta

	if Input.is_action_just_pressed("shoot") and time_shoot <= 0:
		shoot()
		time_shoot = speed_shoot
		
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("L", "R", "U", "D")
	velocity = direction * SPEED
	move_and_slide()

func shoot():
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = pos_bullet.global_position




func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		GameMagager.blood -= 1
		
		print(GameMagager.blood)
