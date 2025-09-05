extends Node


@export var sword_ability_scene: PackedScene


func _ready():
    $Timer.timeout.connect(_on_timer_timeout)   


func _on_timer_timeout():
    var player = get_tree().get_first_node_in_group("player") as Node2D
    if player == null:
        return
    
    var sword_instance = sword_ability_scene.instantiate() as Node2D
    player.get_parent().add_child(sword_instance)
    sword_instance.global_position = player.global_position


