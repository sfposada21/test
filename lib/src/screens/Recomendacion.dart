import 'package:flutter/material.dart';

class Recomendaciones extends StatelessWidget {
  const Recomendaciones({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      {
        'icon': Icons.calendar_today,
        'text': 'Planifica tu semana con una agenda'
      },
      {'icon': Icons.flag, 'text': 'Define metas claras para cada día'},
      {
        'icon': Icons.view_module,
        'text': 'Divide los temas en bloques pequeños'
      },
      {
        'icon': Icons.timer,
        'text': 'Usa la técnica Pomodoro para mantener el foco'
      },
      {'icon': Icons.edit_note, 'text': 'Toma apuntes limpios y organizados'},
      {'icon': Icons.repeat, 'text': 'Repasa frecuentemente lo aprendido'},
      {
        'icon': Icons.do_not_disturb_on,
        'text': 'Elimina distracciones mientras estudias'
      },
      {'icon': Icons.bedtime, 'text': 'Duerme bien para mejorar la memoria'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recomendaciones'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Centra verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centra horizontalmente
          children: [
            const Center(
              child: Text('Recomendaciones',
                  style: TextStyle(color: Colors.white, fontSize: 34)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tips.map((tip) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Icon(tip['icon'] as IconData, color: Colors.black),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            tip['text'] as String,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8.0,
                shadowColor: Colors.black45,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("¡Presióname!"),
            )
          ],
        ),
      ),
    );
  }
}
