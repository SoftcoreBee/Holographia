extends Node2D

var target_enemy: Node2D
var speed = 300.0
var damage_amount = 5

@onready var hitbox_component = $HitboxComponent

func _ready():
    hitbox_component.damage = damage_amount
    
    # Connect the hitbox signal properly
    if hitbox_component.has_signal("area_entered"):
        hitbox_component.area_entered.connect(_on_hitbox_component_area_entered)

func set_target(enemy: Node2D, damage: int):
    target_enemy = enemy
    damage_amount = damage
    hitbox_component.damage = damage

func _physics_process(delta):
    if target_enemy == null:
        queue_free()
        return
    
    # Check if target is still valid
    if not is_instance_valid(target_enemy):
        queue_free()
        return
    
    # Move towards target
    var direction = global_position.direction_to(target_enemy.global_position)
    global_position += direction * speed * delta
    
    # Rotate to face movement direction
    rotation = direction.angle()
    
    # Check if we've reached the target (within a smaller distance for more precision)
    if global_position.distance_to(target_enemy.global_position) < 10.0:
        queue_free() 

func _on_hitbox_component_area_entered(other_area):
    # Check if we hit an enemy's hurtbox
    var hurtbox = other_area as HurtboxComponent
    if hurtbox != null:
        # Destroy projectile immediately when it hits any enemy
        queue_free()
