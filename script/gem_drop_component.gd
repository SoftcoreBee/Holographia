extends Node

@export var gem_scene: PackedScene
@export var health_component: Node


func _ready():
    (health_component as HealthComponent).died.connect(on_died)

func on_died():
    if gem_scene == null:
        return

    if not owner is Node2D:
        return

    var spawn_position = (owner as Node2D).global_position
    var gem_instance = gem_scene.instantiate() as Node2D
    owner.get_parent().add_child(gem_instance)
    gem_instance.global_position = spawn_position