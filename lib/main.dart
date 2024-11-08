import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de Letras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContadorDeLetras(),
    );
  }
}

class ContadorDeLetras extends StatefulWidget {
  @override
  _ContadorDeLetrasState createState() => _ContadorDeLetrasState();
}

class _ContadorDeLetrasState extends State<ContadorDeLetras> {
  final TextEditingController _textController = TextEditingController();

  String _processedText = "";

  void _processText() {
    String input = _textController.text;

    if (input.isEmpty) {
      setState(() {
        _processedText = "Por favor, ingresa texto.";
      });
      return;
    }

    String result = _countCharacters(input);

    setState(() {
      _processedText = result;
    });
  }

  // Función para contar letras
  String _countCharacters(String input) {
    if (input.isEmpty) return "";

    StringBuffer result = StringBuffer();
    int count = 1;

    for (int i = 1; i < input.length; i++) {
      if (input[i] == input[i - 1]) {
        count++;
      } else {
        result.write('${input[i - 1]}$count');
        count = 1;
      }
    }
    result.write('${input[input.length - 1]}$count');

    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Letras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese texto',
                hintText: 'Ej: wwwaabwzx',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _processText,
              child: Text('Procesar Texto'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Texto Procesado:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              _processedText,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}