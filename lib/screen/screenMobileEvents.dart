import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:moviles1/models/Eventos.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:moviles1/database/database_helper.dart';
import '../routes.dart';
import 'modifyEvents.dart';

class EventosScreen extends StatefulWidget {
  @override
  _EventosScreenState createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  Map<DateTime, List<EventModel>>? selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DatabaseHelper? database;
  bool isCalendarView = true;
  EventModel? evento;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
    database = DatabaseHelper();
  }

  List<EventModel> _getEventsfromDay(DateTime date) {
    return selectedEvents![date] ?? [];
  }

  Future<List<EventModel>> _getEventsfromDayList(DateTime date) async {
    final eventos =
        await database!.getEventsForDay(date.toIso8601String() + 'Z');
    if (eventos != null && eventos.isNotEmpty) {
      return eventos;
    } else {
      return [];
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: isCalendarView
                ? Icon(Icons.autorenew_sharp)
                : Icon(Icons.autorenew_sharp),
            onPressed: () {
              setState(() {
                isCalendarView = !isCalendarView;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<EventModel>>(
        future: database!.getAllEventos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            selectedEvents = {};
            for (var evento in snapshot.data!) {
              DateTime fechaEvento = DateTime.parse(evento.fechaEvento!);
              if (selectedEvents![fechaEvento] == null) {
                selectedEvents![fechaEvento] = [];
              }
              selectedEvents![fechaEvento]!.add(evento);
            }
            return isCalendarView
                ? Column(
                    children: [
                      TableCalendar(
                        focusedDay: selectedDay,
                        firstDay: DateTime(1965),
                        lastDay: DateTime(2050),
                        calendarFormat: format,
                        onFormatChanged: (CalendarFormat _format) {
                          setState(() {
                            format = _format;
                          });
                        },
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        daysOfWeekVisible: true,

                        //Day Changed
                        onDaySelected: (DateTime selectDay, DateTime focusDay) {
                          setState(() {
                            selectedDay = selectDay;
                            focusedDay = focusDay;
                          });
                        },
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectedDay, date);
                        },

                        eventLoader: _getEventsfromDay,
                        //To style the Calendar
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                          defaultDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          defaultTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                          weekendDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),

                        headerStyle: HeaderStyle(
                          formatButtonVisible: true,
                          titleCentered: true,
                          formatButtonShowsNext: false,
                          formatButtonDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          formatButtonTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, date, events) {
                            BoxDecoration? decoration;
                            TextStyle? textStyle;
                            if (events.isNotEmpty) {
                              int daysDifference =
                                  date.difference(DateTime.now()).inDays;
                              EventModel eve = events[0] as EventModel;
                              bool? completado = eve.completado;
                              if (daysDifference == 0 && !completado) {
                                // Event is today
                                decoration = BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 0, 255, 8),
                                );
                                textStyle = TextStyle(color: Colors.white);
                              } else if (daysDifference == 1 ||
                                  daysDifference == 2) {
                                // Event is in 1 or 2 days
                                decoration = BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow,
                                );
                              } else if (daysDifference < 0 && !completado) {
                                // Event has passed and not completed
                                decoration = BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                );
                                textStyle = TextStyle(color: Colors.white);
                              } else if (daysDifference < 0 && completado) {
                                decoration = BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 0, 248, 8),
                                );
                              } else if (events.isNotEmpty) {
                                decoration = BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 0, 247, 255),
                                );
                                textStyle = TextStyle(color: Colors.black);
                              }
                            }
                            return Container(
                              width: 50,
                              height: 50,
                              decoration: decoration,
                              child: Center(
                                child: Text(
                                    events.isNotEmpty ? '${date.day}' : '',
                                    style: textStyle),
                              ),
                            );
                          },
                        ),
                      ),
                      ..._getEventsfromDay(selectedDay).map(
                        (EventModel event) => ListTile(
                          title: Text(event.titleE.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text('Editar Evento'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                      hintText: event.titleE
                                                          .toString()),
                                                  controller: _titleController,
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          event.dscEvento),
                                                  controller: _descController,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Completado:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Switch(
                                                      value: event.completado,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          event.completado =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  database!
                                                      .UPDATE(
                                                          'tblEvento',
                                                          {
                                                            'idEvento':
                                                                event.idEvento,
                                                            'titleE':
                                                                _titleController
                                                                    .text
                                                                    .toString(),
                                                            'dscEvento':
                                                                _descController
                                                                    .text
                                                                    .toString(),
                                                            'fechaEvento': event
                                                                .fechaEvento,
                                                            'completado': event
                                                                .completado,
                                                          },
                                                          'idEvento')
                                                      .then((value) {
                                                    var msg = value > 0
                                                        ? 'Registro modificado'
                                                        : 'Ocurrio un error';
                                                    var snackBar = SnackBar(
                                                        content: Text(msg));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                    setState(() {});
                                                  });
                                                  _titleController.clear();
                                                  _descController.clear();
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: Text('Guardar'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancelar'),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.grey),
                                              )
                                            ],
                                          ));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text('Confirmar borrado'),
                                            content:
                                                Text('Deseas borrar el post?'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    database!
                                                        .DELETE(
                                                            'tblEvento',
                                                            event.idEvento!,
                                                            'idEvento')
                                                        .then((value) {
                                                      setState(() {});
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('SI')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('No'))
                                            ],
                                          ));
                                },
                              )
                            ],
                          ),
                          tileColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.2),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(event.titleE.toString()),
                                      content: Text(event.dscEvento.toString()),
                                    ));
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 30, // número de días a mostrar en la lista
                          itemBuilder: (context, index) {
                            final day =
                                DateTime.now().add(Duration(days: index));
                            final fecha = DateFormat('yyyy-MM-dd').format(day);
                            return FutureBuilder<List<EventModel>>(
                              future:
                                  _getEventsfromDayList(DateTime.parse(fecha)),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator(); // muestra un indicador de carga mientras se espera el resultado
                                }
                                final events = snapshot.data ?? [];
                                return Column(
                                  children: [
                                    if (events.isNotEmpty)
                                      Divider(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        height: 1,
                                      ),
                                    ...events.map(
                                      (event) => ListTile(
                                        title: Text(event.titleE.toString()),
                                        subtitle: Text(
                                          DateFormat('EEEE, MMMM d')
                                              .format(day),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.edit),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              title: Text(
                                                                  'Editar Evento'),
                                                              content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  TextFormField(
                                                                    decoration: InputDecoration(
                                                                        hintText: event
                                                                            .titleE
                                                                            .toString()),
                                                                    controller:
                                                                        _titleController,
                                                                  ),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            event.dscEvento),
                                                                    controller:
                                                                        _descController,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Completado:',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      Switch(
                                                                        value: event
                                                                            .completado,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            event.completado =
                                                                                value;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              actions: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    database!
                                                                        .UPDATE(
                                                                            'tblEvento',
                                                                            {
                                                                              'idEvento': event.idEvento,
                                                                              'titleE': _titleController.text.toString(),
                                                                              'dscEvento': _descController.text.toString(),
                                                                              'fechaEvento': event.fechaEvento,
                                                                              'completado': event.completado,
                                                                            },
                                                                            'idEvento')
                                                                        .then(
                                                                            (value) {
                                                                      var msg = value >
                                                                              0
                                                                          ? 'Registro modificado'
                                                                          : 'Ocurrio un error';
                                                                      var snackBar =
                                                                          SnackBar(
                                                                              content: Text(msg));
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                      setState(
                                                                          () {});
                                                                    });
                                                                    _titleController
                                                                        .clear();
                                                                    _descController
                                                                        .clear();
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Text(
                                                                      'Guardar'),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          primary:
                                                                              Colors.grey),
                                                                )
                                                              ],
                                                            ));
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: Text(
                                                              'Confirmar borrado'),
                                                          content: Text(
                                                              'Deseas borrar el post?'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  database!
                                                                      .DELETE(
                                                                          'tblEvento',
                                                                          event
                                                                              .idEvento!,
                                                                          'idEvento')
                                                                      .then(
                                                                          (value) {
                                                                    setState(
                                                                        () {});
                                                                  });
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                        'SI')),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                        'No'))
                                                          ],
                                                        ));
                                              },
                                            )
                                          ],
                                        ),
                                        tileColor: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.4),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    title: Text(event.titleE
                                                        .toString()),
                                                    content: Text(event
                                                        .dscEvento
                                                        .toString()),
                                                  ));
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Center(
              child: Text("No events found."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Nuevo Evento"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'Título'),
                ),
                TextField(
                  controller: _descController,
                  decoration: InputDecoration(hintText: 'Descripción'),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Save"),
                onPressed: () {
                  if (_titleController.text.isEmpty) {
                    print("Event title cannot be empty");
                  } else {
                    final evento = EventModel(
                        titleE: _titleController.text,
                        dscEvento: _descController.text,
                        fechaEvento: selectedDay.toIso8601String(),
                        completado: false);
                    database!.INSERT('tblEvento', evento.toMap());
                    _titleController.clear();
                    _descController.clear();
                    Navigator.pop(context);
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

/*
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'Título'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'Descripción'),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!.add(
                        Event(
                            titleE: _eventController.text,
                            description: _descriptionController.text,
                            date: DateTime.now().toString(),
                            completado: 0),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(
                          titleE: _eventController.text,
                          description: _descriptionController.text,
                          date: DateTime.now().toString(),
                        )
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
*/
