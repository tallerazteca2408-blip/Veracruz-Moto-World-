extends Node

var vida = 100.0
var desgaste = 0.0
var caida = false

signal vida_cambiada(nueva_vida: float)
signal moto_danada()
signal moto_destruida()

func recibir_golpe(dano: float):
    vida = clamp(vida - dano, 0.0, 100.0)
    vida_cambiada.emit(vida)
    moto_danada.emit()

    if vida <= 0.0:
        moto_destruida.emit()

func reparar(cantidad: float):
    vida = clamp(vida + cantidad, 0.0, 100.0)
    vida_cambiada.emit(vida)

func registrar_caida():
    caida = true
    recibir_golpe(5.0)

func reiniciar_caida():
    caida = false

func agregar_desgaste(cantidad: float):
    desgaste = clamp(desgaste + cantidad, 0.0, 100.0)

func obtener_estado():
    return {
        "vida": vida,
        "desgaste": desgaste,
        "caida": caida
    }
