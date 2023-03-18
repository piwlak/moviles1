class Event {
  final int? idEvent;
  final String? description;
  final DateTime? date;
  final int? completado;

  Event({
    this.idEvent,
    this.description,
    this.date,
    this.completado,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
        idEvent: map['idEvent'],
        description: map['descEvent'],
        date: map['dateEvent'],
        completado: map['chkEvent']);
  }
}
