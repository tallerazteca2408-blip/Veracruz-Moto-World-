extends Node

const MAX_JUGADORES = 8
const PUERTO = 7777

var peer = ENetMultiplayerPeer.new()

signal jugador_conectado(id: int)
signal jugador_desconectado(id: int)

func crear_servidor():
    var resultado = peer.create_server(PUERTO, MAX_JUGADORES)

    if resultado != OK:
        print("Error al crear el servidor")
        return false

    multiplayer.multiplayer_peer = peer

    multiplayer.peer_connected.connect(_al_conectar)
    multiplayer.peer_disconnected.connect(_al_desconectar)

    print("Servidor preparado para 8 jugadores")
    return true

func conectar_servidor(ip: String):
    var resultado = peer.create_client(ip, PUERTO)

    if resultado != OK:
        print("Error al conectar")
        return false

    multiplayer.multiplayer_peer = peer
    return true

func _al_conectar(id: int):
    jugador_conectado.emit(id)
    print("Jugador conectado: ", id)

func _al_desconectar(id: int):
    jugador_desconectado.emit(id)
    print("Jugador desconectado: ", id)

func desconectar():
    multiplayer.multiplayer_peer = null
