extends Node

var current_experience: int = 0

func _ready():
    GameEvents.experience_gem_collected.connect(on_experience_gem_collected)

func increment_experience(number: float):
    current_experience += number
    print(current_experience)

func on_experience_gem_collected(number: float):
    increment_experience(number)