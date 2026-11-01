extends Node

var carrera_activa = false
var nombre_carrera = ""
var vueltas_totales = 3
var vuelta_actual = 0
var posicion = 1
var tiempo = 0.0

signal carrera_iniciada(nombre: String)
signal vuelta_completada(vuelta: int)
signal carrera_finalizada(posicion: int, tiempo_final: float)

func iniciar_carrera(nombre: String, vueltas: int):
    if carrera_activa or vueltas <= 0:
        return false

    carrera_activa = true
    nombre_carrera = nombre
    vueltas_totales = vueltas
    vuelta_actual = 0
    tiempo = 0.0

    carrera_iniciada.emit(nombre_carrera)
    return true

func _process(delta):
    if carrera_activa:
        tiempo += delta

func completar_vuelta():
    if not carrera_activa:
        return

    vuelta_actual += 1
    vuelta_completada.emit(vuelta_actual)

    if vuelta_actual >= vueltas_totales:
        finalizar_carrera()

func finalizar_carrera():
    carrera_activa = false
    carrera_finalizada.emit(posicion, tiempo)

func cancelar_carrera():
    carrera_activa = false
    vuelta_actual = 0
    tiempo = 0.0
