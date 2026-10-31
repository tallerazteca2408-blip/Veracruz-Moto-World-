extends Node

var nivel_busqueda = 0
var maximo_estrellas = 3

signal nivel_cambiado(nuevo_nivel: int)

func aumentar_busqueda():
    if nivel_busqueda < maximo_estrellas:
        nivel_busqueda += 1
        nivel_cambiado.emit(nivel_busqueda)

func reducir_busqueda():
    if nivel_busqueda > 0:
        nivel_busqueda -= 1
        nivel_cambiado.emit(nivel_busqueda)

func quitar_busqueda():
    nivel_busqueda = 0
    nivel_cambiado.emit(nivel_busqueda)

func obtener_unidades():
    match nivel_busqueda:
        0:
            return "Sin persecución"
        1:
            return "Una patrulla"
        2:
            return "Varias patrullas"
        3:
            return "Patrullas y helicóptero"
    return ""
