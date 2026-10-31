extends Control

signal direccion_cambiada(direccion: Vector2)

var direccion = Vector2.ZERO
var tocando = false
var centro = Vector2.ZERO
var radio = 70.0

func _ready():
    centro = size / 2

func _gui_input(event):
    if event is InputEventScreenTouch:
        tocando = event.pressed
        if not tocando:
            direccion = Vector2.ZERO
            direccion_cambiada.emit(direccion)

    elif event is InputEventScreenDrag:
        actualizar_direccion(event.position)

func actualizar_direccion(posicion):
    var desplazamiento = posicion - centro
    direccion = desplazamiento.limit_length(radio) / radio
    direccion_cambiada.emit(direccion)

func _draw():
    centro = size / 2
    draw_circle(centro, radio, Color(0.2, 0.2, 0.2, 0.5))
    draw_circle(centro + direccion * radio, 25, Color(0.8, 0.8, 0.8, 0.8))
