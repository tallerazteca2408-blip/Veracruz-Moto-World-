extends Node

var mision_activa = false
var nombre_mision = ""
var recompensa = 0.0
var dinero = null

signal mision_iniciada(nombre: String)
signal mision_completada(nombre: String, pago: float)

func configurar(sistema_dinero: Node):
    dinero = sistema_dinero

func iniciar_mision(nombre: String, pago: float):
    if mision_activa or pago <= 0:
        return false

    nombre_mision = nombre
    recompensa = pago
    mision_activa = true

    mision_iniciada.emit(nombre_mision)
    return true

func completar_mision():
    if not mision_activa:
        return false

    if dinero != null:
        dinero.agregar_dinero(recompensa)

    mision_completada.emit(nombre_mision, recompensa)

    mision_activa = false
    nombre_mision = ""
    recompensa = 0.0
    return true

func cancelar_mision():
    mision_activa = false
    nombre_mision = ""
    recompensa = 0.0
