func crear_motocicleta():
    var moto = Node3D.new()
    moto.name = "Motocicleta"

    var cuerpo = MeshInstance3D.new()
    var malla = BoxMesh.new()
    malla.size = Vector3(0.7, 0.5, 2)

    cuerpo.mesh = malla
    cuerpo.position.y = 0.5

    moto.add_child(cuerpo)

    moto.position.y = 0.2
    moto.set_script(load("res://scripts/motocicleta.gd"))

    add_child(moto)
