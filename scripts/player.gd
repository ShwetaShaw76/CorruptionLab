extends CharacterBody2D

var is_dead = false
const SPEED = 120.0
const JUMP_VELOCITY = -350.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _physics_process(delta: float) -> void:
	
	if is_dead:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true 
		
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else :
			animated_sprite.play("run")
	else :
		animated_sprite.play("jump")
	
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
	
	
func play_death_animation():
	if is_dead:
		return 
	is_dead = true
	velocity = Vector2.ZERO
	print("I'm dead")
	animated_sprite.play("dying")

	
func play_damage_animation():
	print("damage Animation triggered")
	animated_sprite.play("damage")
	
	var sprite = get_tree().root.get_node("Game/fire_ants")
	collision_shape_2d.disabled = true
	await get_tree().create_timer(0.6).timeout
	collision_shape_2d.disabled = false
	
	
	
	
	
