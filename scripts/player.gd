extends CharacterBody2D

var taking_damage = false
var is_dead = false
var SPEED = 120.0
const SPEED_INCREASE = 20.0
var JUMP_VELOCITY = -350.0
const JUMP_VELOCITY_DECREASE = 5
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var health_bar: TextureProgressBar = $HealthBar


	

func _physics_process(delta: float) -> void:
	
	if is_dead:
		return
	
	if taking_damage:
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
	animated_sprite.play("dying")


func play_damage_animation():
	
	print("damage Animation triggered")
	taking_damage = true
	animated_sprite.play("damage")
	health_bar.take_damage()
	await get_tree().create_timer(0.5).timeout
	taking_damage = false
	
	
	
	
	
	


func _on_corruption_guage_corruption_changed(new_corruption: int) -> void:
	SPEED = 120.0 + (new_corruption * SPEED_INCREASE)
	JUMP_VELOCITY = -350 + (new_corruption * JUMP_VELOCITY_DECREASE)
