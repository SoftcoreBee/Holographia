extends Node2D

@export var rainbow_speed: float = 2.0
var time_passed: float = 0.0

func _ready():
    $Area2D.area_entered.connect(_on_area_entered)

func _process(delta):
    time_passed += delta
    var hue = fmod(time_passed * rainbow_speed, 1.0)
    modulate = Color.from_hsv(hue, 1.0, 1.0)

func _on_area_entered(other_area: Area2D):
    GameEvents.emit_experience_gem_collected(1)
    queue_free()