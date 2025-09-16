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
    
    var scythe_instance = scythe_ability_scene.instantiate() as Node2D
    var foreground_layer = get_tree().get_first_node_in_group("foreground_layer")
    foreground_layer.add_child(scythe_instance)
    
    # Set damage if the scythe has a hitbox component
    var hitbox_component = scythe_instance.get_node("HitboxComponent") as HitboxComponent
    if hitbox_component:
        hitbox_component.damage = damage
    
    # Position the scythe in front of the player
    scythe_instance.global_position = player.global_position
    scythe_instance.global_position += Vector2.RIGHT.rotated(player.rotation) * 20
    
    # Set rotation to match player's facing direction
    scythe_instance.rotation = player.rotation
