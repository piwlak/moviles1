class Event {
  final int? idEvent;
  final String? titleE;
  final String? description;
  final String? date;
  final int? completado;

  Event({
    this.idEvent,
    this.titleE,
    this.description,
    this.date,
    this.completado,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
        idEvent: map['idEvent'],
        titleE: map['titleE'],
        description: map['descEvent'],
        date: map['dateEvent'],
        completado: map['chkEvent']);
  }
}
