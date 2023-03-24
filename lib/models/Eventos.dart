class EventModel {
  int? idEvento;
  String? titleE;
  String? dscEvento;
  String? fechaEvento;
  bool? completado;

  EventModel({
    this.idEvento,
    this.titleE,
    this.dscEvento,
    this.fechaEvento,
    this.completado,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
        idEvento: map['idEvento'],
        titleE: map['titleE'],
        dscEvento: map['dscEvento'],
        fechaEvento: map['fechaEvento'],
        completado: map['completado'] == 1 ? true : false);
  }

  Map<String, dynamic> toMap() {
    return {
      'idEvento': idEvento,
      'titleE': titleE,
      'dscEvento': dscEvento,
      'fechaEvento': fechaEvento,
      'completado': completado == true ? 1 : 0,
    };
  }
}
