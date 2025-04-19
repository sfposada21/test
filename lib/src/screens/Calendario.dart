import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  // Controlador para la fecha seleccionada
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  // Mapa para almacenar eventos por fecha
  final Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  // Función para agregar un evento
  void _addEvent(String event) {
    if (_events[_selectedDay] == null) {
      _events[_selectedDay] = [];
    }
    setState(() {
      _events[_selectedDay]?.add(event);
    });
  }

  // Función para verificar si un día tiene eventos
  bool _hasEvents(DateTime day) {
    return _events[day] != null && _events[day]!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBA68C8),
              Color(0xFFB388FF),
              Color(0xFF7C4DFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                // Personalizar el día con eventos
                defaultBuilder: (context, day, focusedDay) {
                  if (_hasEvents(day)) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }
                  return null; // Si no tiene eventos, retorna el valor predeterminado
                },
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Eventos',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(height: 10),
            // Mostrar los eventos de la fecha seleccionada
            Expanded(
              child: ListView(
                children: _events[_selectedDay]?.map((event) {
                  return ListTile(
                    title: Text(
                      event,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList() ??
                    [],
              ),
            ),
            // Botón para agregar un evento
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes mostrar un cuadro de texto o una pantalla para agregar un evento
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController eventController =
                          TextEditingController();
                      return AlertDialog(
                        title: const Text('Agregar evento'),
                        content: TextField(
                          controller: eventController,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa un evento',
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              if (eventController.text.isNotEmpty) {
                                _addEvent(eventController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Agregar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Agregar Evento'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
