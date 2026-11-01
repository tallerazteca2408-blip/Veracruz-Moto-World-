extends Node

var capacidad_tanque = 14.0
var gasolina = 14.0
var consumo_por_segundo = 0.015

signal gasolina_cambiada(nivel: float)
signal tanque_vacio()

func consumir_gasolina(delta: float, acelerando: bool):
    if acelerando and gasolina > 0.0:
        gasolina = max(
            gasolina - consumo_por_segundo * delta,
            0.0
        )
        gasolina_cambiada.emit(gasolina)

        if gasolina <= 0.0:
            tanque_vacio.emit()

func cargar_gasolina(cantidad: float):
    gasolina = clamp(
        gasolina + cantidad,
        0.0,
        capacidad_tanque
    )
    gasolina_cambiada.emit(gasolina)

func porcentaje_gasolina() -> float:
    return (gasolina / capacidad_tanque) * 100.0
