
extends Node2D

@export var cell_size := 64
@export var grid_width := 100
@export var grid_height := 100
@export var grid_color := Color(0.3,0.3,0.3,0.8)
@export var grid_thickness := 1.0

func _ready():
    update()

func _draw():
    var total_width = grid_width * cell_size
    var total_height = grid_height * cell_size

    for x in range(grid_width+1):
        var px = x * cell_size
        draw_line(Vector2(px,0), Vector2(px,total_height), grid_color, grid_thickness)

    for y in range(grid_height+1):
        var py = y * cell_size
        draw_line(Vector2(0,py), Vector2(total_width,py), grid_color, grid_thickness)
