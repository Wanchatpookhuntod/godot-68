extends Area2D

var speed: float = 700

func _process(delta: float) -> void:
	await get_tree().create_timer(2).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position.y -= speed * delta
