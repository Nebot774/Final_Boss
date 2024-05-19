import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MarsRoverSearchWidget extends StatefulWidget {
  final Function(String roverName, DateTime date, String camera) onSearch;
  final String roverName;

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
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
            style: TextStyle( // Añadido estilo
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Fecha de búsqueda',
              labelStyle: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
            ),
            readOnly: true,
            controller: TextEditingController(
              text: DateFormat('yyyy-MM-dd').format(selectedDate),
            ),
            style: TextStyle( // Añadido estilo
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
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
                child: Text(camera, style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCamera = newValue!;
              });
            },
            dropdownColor: Colors.black, // Añadido para cambiar el color de fondo a negro
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              widget.onSearch(widget.roverName, selectedDate, selectedCamera);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              textStyle: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
              ),
            ),
            child: FittedBox(
              child: Text(
                'Buscar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}