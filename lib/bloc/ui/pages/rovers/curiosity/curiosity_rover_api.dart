import 'package:flutter/material.dart';

class CuriosityRover extends StatefulWidget {
  @override
  _CuriosityRoverState createState() => _CuriosityRoverState();
}

class _CuriosityRoverState extends State<CuriosityRover> {
  DateTime selectedDate = DateTime.now();
  String selectedCamera = 'NAVCAM - Cámara de Navegación'; // Opción por defecto
  final List<String> cameras = [
    'NAVCAM - Cámara de Navegación',
    'FHAZ - Frontal',
    'RHAZ - Trasera'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2004, 1, 4), // Fecha de aterrizaje del Opportunity
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro para toda la pantalla
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cámaras',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            DropdownButton<String>(
              value: selectedCamera,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCamera = newValue!;
                });
              },
              items: cameras.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.black)),
                );
              }).toList(),
              dropdownColor: Colors.grey[800],
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                "Selecciona una fecha: ${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(
                  fontFamily: 'Exo',
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900], // Botón azul
              ),
            ),
            // Aquí puedes añadir más widgets según lo necesites
          ],
        ),
      ),
    );
  }
}
