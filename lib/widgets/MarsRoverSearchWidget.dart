import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MarsRoverSearchWidget extends StatefulWidget {
  final Function(String roverName, DateTime date, String camera) onSearch;

  MarsRoverSearchWidget({required this.onSearch});

  @override
  _MarsRoverSearchWidgetState createState() => _MarsRoverSearchWidgetState();
}

class _MarsRoverSearchWidgetState extends State<MarsRoverSearchWidget> {
  String selectedRover = 'Curiosity';
  DateTime selectedDate = DateTime.now();
  String selectedCamera = 'NAVCAM';

  final List<String> rovers = ['Curiosity', 'Opportunity', 'Spirit'];
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
        DropdownButtonFormField(
          value: selectedRover,
          decoration: InputDecoration(labelText: 'Rover'),
          items: rovers.map((rover) {
            return DropdownMenuItem(
              value: rover,
              child: Text(rover),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedRover = newValue!;
            });
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Fecha de búsqueda',
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
          readOnly: true,
          controller: TextEditingController(
            text: DateFormat('yyyy-MM-dd').format(selectedDate),
          ),
        ),
        DropdownButtonFormField(
          value: selectedCamera,
          decoration: InputDecoration(labelText: 'Cámara'),
          items: cameras.map((camera) {
            return DropdownMenuItem(
              value: camera,
              child: Text(camera),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCamera = newValue!;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSearch(selectedRover, selectedDate, selectedCamera);
          },
          child: Text('Buscar'),
        ),
      ],
    );
  }
}
