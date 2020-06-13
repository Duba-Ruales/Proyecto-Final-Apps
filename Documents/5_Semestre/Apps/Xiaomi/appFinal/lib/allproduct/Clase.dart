class Datos {
  final String id;
  final String nombre, precio, descripcion, imgen;

  Datos({
    this.id,
    this.nombre,
    this.precio,
    this.descripcion,
    this.imgen,
  });
  factory Datos.fromJson(Map<String, dynamic> jsonData) {
    return Datos(
      id: jsonData['id'],
      nombre: jsonData['nombre'],
      precio: jsonData['precio'],
      descripcion: jsonData['descripcion'],
      imgen: "http://192.168.2.102/tienda/img_temp/" + jsonData['img'],
    );
  }
}
