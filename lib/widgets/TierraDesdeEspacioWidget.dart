import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/blocs/TierraDesdeEspacioBloc.dart';
import '../bloc/states/TierraDesdeEspacioState.dart';


class TierraDesdeEspacioWidget extends StatefulWidget {
  final TextEditingController latController;
  final TextEditingController lonController;
  final DateTime selectedDate;
  final Function(BuildContext) selectDate;
  final Function search;

  TierraDesdeEspacioWidget({
    required this.latController,
    required this.lonController,
    required this.selectedDate,
    required this.selectDate,
    required this.search,
  });

  @override
  _TierraDesdeEspacioWidgetState createState() => _TierraDesdeEspacioWidgetState();
}

class _TierraDesdeEspacioWidgetState extends State<TierraDesdeEspacioWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: widget.latController,
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
              controller: widget.lonController,
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
              onPressed: () => widget.selectDate(context),
              child: Text(
                'Fecha: ${DateFormat('yyyy-MM-dd').format(widget.selectedDate)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => widget.search(),
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
    );
  }
}
