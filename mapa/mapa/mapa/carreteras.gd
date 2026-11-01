extends Node3D

func crear_carretera(inicio: Vector3, final: Vector3, ancho: float = 8.0):
    var carretera = MeshInstance3D.new()
    var malla = BoxMesh.new()

    var distancia = inicio.distance_to(final)
    malla.size = Vector3(ancho, 0.15, distancia)

    carretera.mesh = malla
    carretera.position = (inicio + final) / 2
    carretera.look_at(final, Vector3.UP)

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.12, 0.12, 0.12)
    carretera.material_override = material

    add_child(carretera)
    return carretera
