extends Node2D
class_name ScytheAbility

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
    animation_player.play("swing")
    
    animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(animation_name: String):
    if animation_name == "swing":
        queue_free()
