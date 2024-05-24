import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';

import '../../bloc/blocs/TierraDesdeEspacioBloc.dart';
import '../../bloc/events/TierraDesdeEspacioEvent.dart';
import '../../bloc/states/TierraDesdeEspacioState.dart';

class TierraDesdeEspacio extends StatefulWidget {
  @override
  _TierraDesdeEspacioState createState() => _TierraDesdeEspacioState();
}

class _TierraDesdeEspacioState extends State<TierraDesdeEspacio> {
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lonController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Cambia el color del icono a blanco
        title: Padding(
          padding: EdgeInsets.only(left: 0.0), // Añade margen a la izquierda del título
          child: Text(
            'Imágenes de la Tierra desde el Espacio',
            style: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900], // Cambia el color de fondo de la AppBar a azul
        actions: <Widget>[
          IconButton(
            icon: Text(
              'T.C',
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
                fontSize: 24.0, // Aumenta el tamaño del texto
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TermsAndConditionsScreen(),
              ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Añade esto
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _latController,
                decoration: InputDecoration(
                  labelText: 'Latitud',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _lonController,
                decoration: InputDecoration(
                  labelText: 'Longitud',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  'Fecha: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _search(),
                child: Text('Buscar'),
              ),
              SizedBox(height: 10),
              BlocBuilder<TierraDesdeEspacioBloc, TierraDesdeEspacioState>(
                builder: (context, state) {
                  if (state is TierraDesdeEspacioLoading) {
                    return CircularProgressIndicator();
                  } else if (state is TierraDesdeEspacioLoaded) {
                    print(state.tierraDesdeEspacio.url); // Imprime la URL en la consola
                    return Image.network(state.tierraDesdeEspacio.url);
                  } else if (state is TierraDesdeEspacioError) {
                    print(state.message); // Imprime el mensaje de error en la consola
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
  _search() {
    final lat = double.tryParse(_latController.text);
    final lon = double.tryParse(_lonController.text);
    final date = DateFormat('yyyy-MM-dd').format(_selectedDate);

    if (lat != null && lon != null) {
      BlocProvider.of<TierraDesdeEspacioBloc>(context).add(
        FetchTierraDesdeEspacio(lat, lon, date),
      );
    }
  }
}
