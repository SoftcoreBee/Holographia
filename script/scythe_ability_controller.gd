extends Node

@export var scythe_ability_scene: PackedScene

var damage = 8

func _input(event):
    if event.is_action_pressed("swing_scythe"):
        swing_scythe()

func swing_scythe():
    var player = get_tree().get_first_node_in_group("player") as Node2D
    if player == null:
        return
    
    
    var movement_vector = _get_movement_vector()
    var movement_direction = movement_vector.normalized()
    
    
    if movement_vector.length() < 0.1:
        movement_direction = Vector2.RIGHT
    
    var scythe_instance = scythe_ability_scene.instantiate() as Node2D
    var foreground_layer = get_tree().get_first_node_in_group("foreground_layer")
    foreground_layer.add_child(scythe_instance)
    
    
    var hitbox_component = scythe_instance.get_node("HitboxComponent") as HitboxComponent
    if hitbox_component:
        hitbox_component.damage = damage
    
    scythe_instance.global_position = player.global_position
    scythe_instance.global_position += movement_direction * 20

    scythe_instance.rotation = movement_direction.angle()

func _get_movement_vector():
    var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    return Vector2(x_movement, y_movement)
