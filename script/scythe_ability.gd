extends Node2D
class_name ScytheAbility

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
    # Start the swing animation
    animation_player.play("swing")
    
    # Connect to animation finished signal to destroy the scythe
    animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(animation_name: String):
    if animation_name == "swing":
        queue_free()
