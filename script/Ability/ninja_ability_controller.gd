extends Node

@export var ninja_ability_scene: PackedScene
var damage = 5
var base_wait_time = 3.5

@onready var timer = $Timer

func _ready():
    timer.timeout.connect(on_timer_timeout)
    GameEvents.ability_upgrade_added.connect(on_ability_upgrade_added)

func on_timer_timeout():
    var player = get_tree().get_first_node_in_group("player") as Node2D
    if player == null:
        return
    
    var enemies = get_tree().get_nodes_in_group("enemy")
    if enemies.size() == 0:
        return
    
    # Pick a random enemy
    var target_enemy = enemies.pick_random() as Node2D
    if target_enemy == null:
        return
    
    # Create ninja projectile
    var ninja_ability_instance = ninja_ability_scene.instantiate() as Node2D
    var foreground_layer = get_tree().get_first_node_in_group("foreground_layer")
    foreground_layer.add_child(ninja_ability_instance)
    
    # Position at player location
    ninja_ability_instance.global_position = player.global_position
    
    # Set target for the projectile
    if ninja_ability_instance.has_method("set_target"):
        ninja_ability_instance.set_target(target_enemy, damage)

func on_ability_upgrade_added(upgrade: AbilityUpgrade, current_upgrades: Dictionary):
    if upgrade.id != "ninja_ability":
        return
    
    var current_quantity = current_upgrades["ninja_ability"]["quantity"]
    if current_quantity == 1:
        # First upgrade - enable the ability
        pass
    else:
        # Additional upgrades - improve the ability
        damage += 2
        timer.wait_time = max(0.5, base_wait_time - (current_quantity - 1) * 0.1)
