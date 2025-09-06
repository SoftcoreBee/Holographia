extends CharacterBody2D

const MAX_SPEED = 125
const ACCELERATION_SMOOTHING = 25

func _ready ():
    pass

func _process(_delta):
    var movement_vector = _get_movement_vector()
    var direction = movement_vector.normalized()
    var target_velocity = direction * MAX_SPEED
    velocity = velocity.lerp(target_velocity, 1.0 - exp(-_delta * ACCELERATION_SMOOTHING))
    move_and_slide()

func _get_movement_vector():
    var x_movent = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    var y_movent = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    return Vector2(x_movent, y_movent)




