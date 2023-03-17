class Evento {
  int id;
  String descripcion;
  DateTime fecha;
  bool completado;

  Evento(
      {required this.id,
      required this.descripcion,
      required this.fecha,
      required this.completado});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
      'fecha': fecha.toIso8601String(),
      'completado': completado ? 1 : 0
    };
  }

  static Evento fromMap(Map<String, dynamic> map) {
    return Evento(
        id: map['id'],
        descripcion: map['descripcion'],
        fecha: DateTime.parse(map['fecha']),
        completado: map['completado'] == 1 ? true : false);
  }

  Future<int> copy({required int id}) async {
    return id;
  }
}
