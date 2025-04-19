import 'package:flutter/material.dart';

class Metodos extends StatelessWidget {
  const Metodos({super.key});

  @override
  Widget build(BuildContext context) {
    final methods = [
      {
        'icon': Icons.bubble_chart,
        'text': 'Mapa mental: organiza ideas visualmente'
      },
      {
        'icon': Icons.child_care,
        'text': 'Feynman: explica el tema como si fueras a enseñarlo'
      },
      {
        'icon': Icons.style,
        'text': 'Flashcards: memoriza conceptos con tarjetas'
      },
      {
        'icon': Icons.menu_book,
        'text': 'Lectura activa: subraya, resume y haz preguntas'
      },
      {'icon': Icons.repeat_on, 'text': 'Espaciado: repasa en intervalos'},
      {
        'icon': Icons.record_voice_over,
        'text': 'Estudio en voz alta: mejora la retención'
      },
      {
        'icon': Icons.text_snippet,
        'text': 'Resumen y esquemas: sintetiza lo aprendido'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Metodos de estudio'), 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.cyan,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Centra verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centra horizontalmente
          children: [
            const Center(
              child: Text('Metodos',
                  style: TextStyle(color: Colors.white, fontSize: 34)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: methods.map((tip) {
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
