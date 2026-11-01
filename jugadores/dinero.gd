extends Node

var saldo = 5000.0

signal saldo_cambiado(nuevo_saldo: float)

func agregar_dinero(cantidad: float):
    if cantidad <= 0:
        return

    saldo += cantidad
    saldo_cambiado.emit(saldo)

func gastar_dinero(cantidad: float) -> bool:
    if cantidad <= 0 or saldo < cantidad:
        return false

    saldo -= cantidad
    saldo_cambiado.emit(saldo)
    return true

func consultar_saldo() -> float:
    return saldo
