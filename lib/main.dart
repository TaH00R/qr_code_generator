import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Generator',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 20, 41, 235),
        scaffoldBackgroundColor: Color(0xFF121212),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[900],
          labelStyle: TextStyle(color: Colors.tealAccent),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 32, 86, 202),
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: QRCodeGenerator(),
    );
  }
}

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  TextEditingController _controller = TextEditingController();
  String qrData = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
        backgroundColor: const Color.fromARGB(255, 43, 86, 217),
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: qrData,
                size: 200.0,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Enter text",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = _controller.text.isEmpty ? "Hello World" : _controller.text;
                  });
                },
                child: Text("Generate QR Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
