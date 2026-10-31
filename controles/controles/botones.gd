extends Control

signal acelerar_cambiado(activado: bool)
signal frenar_cambiado(activado: bool)

func _ready():
    pass

func _on_acelerar_button_down():
    acelerar_cambiado.emit(true)

func _on_acelerar_button_up():
    acelerar_cambiado.emit(false)

func _on_frenar_button_down():
    frenar_cambiado.emit(true)

func _on_frenar_button_up():
    frenar_cambiado.emit(false)
