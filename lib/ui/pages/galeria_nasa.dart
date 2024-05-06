import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs/GaleriaBloc.dart';
import '../../bloc/events/GaleriaEvent.dart';
import '../../bloc/states/GaleriaState.dart';

class GaleriaNasa extends StatefulWidget {
  @override
  _GaleriaNasaState createState() => _GaleriaNasaState();
}

class _GaleriaNasaState extends State<GaleriaNasa> {
  TextEditingController _queryController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  String _selectedMediaType = 'Todos'; // Valor inicial

  @override
  void dispose() {
    // Asegúrate de limpiar los controladores cuando el widget se desmonte
    _queryController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Galería de Imágenes y Vídeos de la NASA',
          style: TextStyle(
            fontFamily: 'Exo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Text(
              'T.C',
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24.0,
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
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.search),
        onPressed: () {
          _queryController.clear();
          _startDateController.clear();
          _endDateController.clear();
          // Opcional: Agregar lógica para reiniciar la búsqueda o estado
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildBody() {
    return BlocBuilder<GaleriaBloc, GaleriaState>(
      builder: (context, state) {
        if (state is GaleriaInitial) {
          return buildInitialInput();
        } else if (state is GaleriaLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GaleriaLoaded) {
          if (state.galeriaData != null && state.galeriaData.smallImageUrl != null && state.galeriaData.smallImageUrl!.isNotEmpty) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        children: [
                          Image.network(state.galeriaData.smallImageUrl ?? ''),
                          Text(state.galeriaData.center ?? ''),
                          Text(state.galeriaData.title ?? ''),
                          Text(state.galeriaData.description ?? ''),
                        ],
                      ),
                      actions: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.network(state.galeriaData.smallImageUrl ?? ''),
            );
          } else {
            return Text('No data available');
          }
        } else if (state is GaleriaError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('Estado desconocido'));
        }
      },
    );
  }


  Widget buildInitialInput() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _queryController,
              decoration: InputDecoration(
                labelText: 'Buscar por tema',
                hintText: 'Ej. Apollo 11',
              ),
            ),
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Fecha de inicio (YYYY-MM-DD)',
                hintText: 'Ej. 1969-07-16',
              ),
            ),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'Fecha de fin (YYYY-MM-DD)',
                hintText: 'Ej. 1969-07-24',
              ),
            ),
            DropdownButton<String>(
              value: _selectedMediaType,
              onChanged: (newValue) {
                setState(() {
                  _selectedMediaType = newValue!;
                });
              },
              items: <String>['Todos', 'Imagen', 'Video']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GaleriaBloc>(context).add(
                    FetchGaleriaData(
                      query: _queryController.text,
                      startDate: _startDateController.text,
                      endDate: _endDateController.text,
                      mediaType: _selectedMediaType,
                    )
                );
              },
              child: Text('Buscar'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GaleriaBloc>(context).add(
                    FetchGaleriaDefectoData()
                );
              },
              child: Text('Búsqueda por Defecto'),
            ),
          ],
        ),
      ),
    );
  }
}
