import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs/GaleriaBloc.dart';
import '../../bloc/events/GaleriaEvent.dart';
import '../../bloc/states/GaleriaState.dart';
import '../../models/GaleriaData.dart';

class GaleriaNasa extends StatefulWidget {
  @override
  _GaleriaNasaState createState() => _GaleriaNasaState();
}

enum InputState { initial, personalized, personalizedLoaded, defaultState } // Cambiado 'default' a 'defaultState'

class _GaleriaNasaState extends State<GaleriaNasa> {
  TextEditingController _queryController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _numResultsController = TextEditingController(); // Nuevo controlador
  String _selectedMediaType = 'Todos'; // Valor inicial

  InputState _inputState = InputState.initial; // Nuevo estado

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
          // Cambiar el estado para mostrar buildInitialButtons()
          setState(() {
            _inputState = InputState.initial;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildBody() {
    switch (_inputState) {
      case InputState.initial:
        return buildInitialButtons();
      case InputState.personalized: // Nuevo caso
        return buildPersonalizedInput();
      case InputState.personalizedLoaded:
        return BlocBuilder<GaleriaBloc, GaleriaState>(
          builder: (context, state) {
            if (state is GaleriaLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GaleriaLoaded) {
              return buildResults(state.galeriaData);
            } else if (state is GaleriaError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Estado desconocido'));
            }
          },
        );
      case InputState.defaultState:
        return BlocBuilder<GaleriaBloc, GaleriaState>(
          builder: (context, state) {
            if (state is GaleriaLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GaleriaDefectoLoaded) {
              return buildDefaultInput(state.galeriaData);
            } else if (state is GaleriaError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Estado desconocido'));
            }
          },
        );
      default:
        return Container();  // Manejador por defecto para estados no reconocidos
    }
  }



  Widget buildInitialButtons() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                _inputState = InputState.personalized;
              });
            },
            child: Text('Busqueda Personalizada'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _inputState = InputState.defaultState;
              });
              BlocProvider.of<GaleriaBloc>(context).add(FetchGaleriaDefectoData());
            },
            child: Text('Búsqueda por Defecto'),
          )
        ],
      ),
    );
  }

  Widget buildDefaultInput(GaleriaData galeriaData) {
    return ListView.builder(
      itemCount: galeriaData.items.length,
      itemBuilder: (context, index) {
        var item = galeriaData.items[index];
        var smallImageUrl = item.imageLinks?.firstWhere((link) => link.endsWith('small.jpg'), orElse: () => '') ?? '';

        return Column(
          children: <Widget>[
            if (smallImageUrl != null && smallImageUrl.isNotEmpty)
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Image.network(smallImageUrl),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.network(smallImageUrl),
              )
            else
              Text('No image available'),
            if (item.description != null && item.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.description!),
              )
            else
              Text('No description available'),
          ],
        );
      },
    );
  }

  Widget buildPersonalizedInput([GaleriaData? galeriaData]) {
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
            TextField(
              controller: _numResultsController, // Asegúrate de inicializar este controlador
              decoration: InputDecoration(
                labelText: 'Número de resultados',
                hintText: 'Ej. 10',
              ),
              keyboardType: TextInputType.number, // Para permitir solo la entrada de números
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
                int numResults = int.parse(_numResultsController.text); // Convierte el texto a un entero
                BlocProvider.of<GaleriaBloc>(context).add(
                    FetchGaleriaData(
                      query: _queryController.text,
                      startDate: _startDateController.text,
                      endDate: _endDateController.text,
                      mediaType: _selectedMediaType,
                      numResults: numResults, // Añade el parámetro numResults
                    )
                );
                setState(() {
                  _inputState = InputState.personalizedLoaded; // Cambia el estado a personalizedLoaded
                });
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildResults(GaleriaData galeriaData) {
    return ListView.builder(
      itemCount: galeriaData.items.length,
      itemBuilder: (context, index) {
        var item = galeriaData.items[index];
        var smallImageUrl = item.imageLinks?.firstWhere((link) => link.endsWith('small.jpg'), orElse: () => '') ?? '';

        return Column(
          children: <Widget>[
            if (smallImageUrl != null && smallImageUrl.isNotEmpty)
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Image.network(smallImageUrl),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.network(smallImageUrl),
              )
            else
              Text('No image available'),
            if (item.description != null && item.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.description!),
              )
            else
              Text('No description available'),
          ],
        );
      },
    );
  }


}
