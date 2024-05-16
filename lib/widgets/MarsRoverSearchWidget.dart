import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MarsRoverSearchWidget extends StatefulWidget {
  final Function(String roverName, DateTime date, String camera) onSearch;
  final String roverName; // Añadimos esta propiedad para saber el nombre del rover

  MarsRoverSearchWidget({required this.onSearch, required this.roverName});

  @override
  _MarsRoverSearchWidgetState createState() => _MarsRoverSearchWidgetState();
}

class _MarsRoverSearchWidgetState extends State<MarsRoverSearchWidget> {
  DateTime selectedDate = DateTime.now();
  String selectedCamera = 'NAVCAM';

  final List<String> cameras = ['NAVCAM', 'FHAZ', 'RHAZ'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2004, 1, 4),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0), // Margen superior
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Rover',
              labelStyle: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            initialValue: widget.roverName,
            style: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 16), // Espaciado entre campos
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Fecha de búsqueda',
            labelStyle: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today, color: Colors.white),
              onPressed: () => _selectDate(context),
            ),
            border: OutlineInputBorder(),
          ),
          readOnly: true,
          controller: TextEditingController(
            text: DateFormat('yyyy-MM-dd').format(selectedDate),
          ),
          style: TextStyle(
            fontFamily: 'Exo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16), // Espaciado entre campos
        DropdownButtonFormField(
          value: selectedCamera,
          decoration: InputDecoration(
            labelText: 'Cámara',
            labelStyle: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            border: OutlineInputBorder(),
          ),
          items: cameras.map((camera) {
            return DropdownMenuItem(
              value: camera,
              child: Text(
                camera,
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCamera = newValue!;
            });
          },
          style: TextStyle(
            fontFamily: 'Exo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          dropdownColor: Colors.blue[900], // Color del fondo del dropdown
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.onSearch(widget.roverName, selectedDate, selectedCamera);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // Fondo rojo
            textStyle: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          child: Text('Buscar'),
        ),
      ],
    );
  }
}
