extends Node2D

func _ready():
    $Area2D.area_entered.connect(_on_area_entered)
    

func _on_area_entered(other_area: Area2D):
    GameEvents.emit_experience_gem_collected(1)
    queue_free()