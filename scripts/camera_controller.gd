
extends Camera2D
@export var zoom_min: float = 0.3
@export var zoom_max: float = 3.0
@export var zoom_step: float = 0.1
var drag_active := false
var last_pos := Vector2.ZERO

func _ready():
    current = true

func _unhandled_input(event):
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT:
            if event.pressed:
                drag_active = true
                last_pos = event.position
            else:
                drag_active = false

        if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
            _change_zoom(-zoom_step)
        elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
            _change_zoom(zoom_step)

    elif event is InputEventMouseMotion and drag_active:
        var delta = event.position - last_pos
        position -= delta * zoom.x
        last_pos = event.position

    elif event is InputEventMagnifyGesture:
        _change_zoom(-zoom_step if event.factor > 1.0 else zoom_step)
    elif event is InputEventPanGesture:
        position -= event.delta * zoom.x

func _change_zoom(delta):
    var z = clamp(zoom.x + delta, zoom_min, zoom_max)
    zoom = Vector2(z, z)
