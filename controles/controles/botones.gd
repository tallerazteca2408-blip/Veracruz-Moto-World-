
extends Control

signal acelerar_cambiado(activado: bool)
signal frenar_cambiado(activado: bool)

func _ready():
    crear_boton("ACELERAR", Vector2(0.78, 0.72), true)
    crear_boton("FRENAR", Vector2(0.78, 0.88), false)

func crear_boton(texto: String, posicion: Vector2, es_acelerador: bool):
    var boton = Button.new()
    boton.text = texto
    boton.anchor_left = posicion.x
    boton.anchor_top = posicion.y
    boton.anchor_right = posicion.x + 0.18
    boton.anchor_bottom = posicion.y + 0.10
    boton.offset_left = 0
    boton.offset_top = 0
    boton.offset_right = 0
    boton.offset_bottom = 0
    boton.add_theme_font_size_override("font_size", 20)
    add_child(boton)

    if es_acelerador:
        boton.button_down.connect(func():
            acelerar_cambiado.emit(true)
        )
        boton.button_up.connect(func():
            acelerar_cambiado.emit(false)
        )
    else:
        boton.button_down.connect(func():
            frenar_cambiado.emit(true)
        )
        boton.button_up.connect(func():
            frenar_cambiado.emit(false)
        )
