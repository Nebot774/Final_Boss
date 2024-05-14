import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PersonalizedInputWidget extends StatelessWidget {
  final TextEditingController queryController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController numResultsController;
  final String selectedMediaType;
  final Function(String) onMediaTypeChanged;
  final Function onSearchPressed;

  PersonalizedInputWidget({
    required this.queryController,
    required this.startDateController,
    required this.endDateController,
    required this.numResultsController,
    required this.selectedMediaType,
    required this.onMediaTypeChanged,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black, // Color de fondo del contenedor
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: queryController,
              decoration: InputDecoration(
                labelText: 'Buscar por tema',
                hintText: 'Ej. Apollo 11',
                labelStyle: TextStyle(color: Colors.white), // Estilo del texto de la etiqueta
                hintStyle: TextStyle(color: Colors.white54), // Estilo del texto de sugerencia
                filled: true,
                fillColor: Colors.white10, // Color de fondo del TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde
                ),
              ),
              style: TextStyle(color: Colors.white), // Estilo del texto ingresado
            ),
            SizedBox(height: 10), // Espacio entre los TextFields
            TextField(
              controller: startDateController,
              decoration: InputDecoration(
                labelText: 'Fecha de inicio (YYYY-MM-DD)',
                hintText: 'Ej. 1969-07-16',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: endDateController,
              decoration: InputDecoration(
                labelText: 'Fecha de fin (YYYY-MM-DD)',
                hintText: 'Ej. 1969-07-24',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numResultsController,
              decoration: InputDecoration(
                labelText: 'Número de resultados',
                hintText: 'Ej. 10',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedMediaType,
              dropdownColor: Colors.grey[900], // Color de fondo del menú desplegable
              onChanged: (newValue) {
                onMediaTypeChanged(newValue!);
              },
              items: <String>['Todos', 'Imagen', 'Video']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)), // Estilo del texto del Dropdown
                );
              }).toList(),
            ),
            SizedBox(height: 20), // Espacio antes del botón
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Color del botón
                onPrimary: Colors.white, // Color del texto
                textStyle: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                onSearchPressed();
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}

