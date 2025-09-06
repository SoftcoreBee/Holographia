extends Node

@export_range(0, 1) var drop_percent: float = 0.5
@export var health_component: Node
@export var gem_scene: PackedScene


func _ready():
    (health_component as HealthComponent).died.connect(on_died)

func on_died():
    if randf() > drop_percent:
        return
    
    if gem_scene == null:
        return

    if not owner is Node2D:
        return

    var spawn_position = (owner as Node2D).global_position
    var gem_instance = gem_scene.instantiate() as Node2D
    owner.get_parent().add_child(gem_instance)
    gem_instance.global_position = spawn_position