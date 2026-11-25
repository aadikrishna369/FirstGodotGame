extends CharacterBody2D

@export var speed: float = 150.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_facing_direction: String = "down"

func _physics_process(delta: float) -> void:

	var direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
        "move_down"
	)
	
	if direction != Vector2.ZERO:
		
		
		if (abs(direction.x) > abs(direction.y)):
			if direction.x > 0:
				last_facing_direction = "right"
			else:
				last_facing_direction = "left"
		else:
			if direction.y > 0:
				last_facing_direction = "down"
			else:
				last_facing_direction = "up"
			
	var animation_name: String
	
	if direction == Vector2.ZERO:
		animation_name = "idle_" + last_facing_direction
	else:
		animation_name = "walk_" + last_facing_direction
		
	if last_facing_direction == "left":
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
		
	if animated_sprite.animation != animation_name or not animated_sprite.is_playing():
		animated_sprite.play(animation_name) 

	velocity = direction * speed

	move_and_slide()
	
