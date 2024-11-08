import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador Letras',
      theme: ThemeData(
        primaryColor: Colors.green.shade600,
        colorScheme:
        ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
          secondary: Colors.greenAccent,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87, fontSize: 18.0),
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
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

  void _Textoo() {
    String input = _textController.text;

    if (input.isEmpty) {
      setState(() {
        _processedText = "ingresa texto Arriba.";
      });
      return;
    }

    String result = _Caracteres(input);
    setState(() {
      _processedText = result;
    });
  }

  String _Caracteres(String input) {
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
        title:
        Text('Contador de Letras', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _textController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  labelText: 'Ingrese texto',
                  labelStyle: TextStyle(color: Colors.green.shade700),
                  prefixIcon: Icon(Icons.text_fields,
                      color: const Color.fromARGB(255, 17, 17, 17)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _Textoo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Procesar Texto',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Texto Procesado:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  _processedText,
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}