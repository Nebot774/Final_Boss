import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs/GaleriaBloc.dart';
import '../../bloc/events/GaleriaEvent.dart';
import '../../bloc/states/GaleriaState.dart';
import '../../models/GaleriaData.dart';
import '../../widgets/DefaultInputWidget.dart';
import '../../widgets/PersonalizedInputWidget.dart';
import 'menu_page.dart';
import 'package:flutter/material.dart';


class GaleriaNasa extends StatefulWidget {
  @override
  _GaleriaNasaState createState() => _GaleriaNasaState();
}

enum InputState { initial, personalized, personalizedLoaded, defaultState }

class _GaleriaNasaState extends State<GaleriaNasa> {
  TextEditingController _queryController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _numResultsController = TextEditingController();
  String _selectedMediaType = 'Todos';

  InputState _inputState = InputState.initial;

  @override
  void dispose() {
    _queryController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            BlocProvider.of<GaleriaBloc>(context).add(ResetGaleria());
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPage()));
          },
        ),
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
      floatingActionButton: _inputState != InputState.initial
          ? FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.search),
        onPressed: () {
          _queryController.clear();
          _startDateController.clear();
          _endDateController.clear();
          setState(() {
            _inputState = InputState.initial;
          });
        },
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildBody() {
    switch (_inputState) {
      case InputState.initial:
        return buildInitialButtons();
      case InputState.personalized:
        return PersonalizedInputWidget(
          queryController: _queryController,
          startDateController: _startDateController,
          endDateController: _endDateController,
          numResultsController: _numResultsController,
          selectedMediaType: _selectedMediaType,
          onMediaTypeChanged: (newValue) {
            setState(() {
              _selectedMediaType = newValue;
            });
          },
          onSearchPressed: () {
            int numResults = int.parse(_numResultsController.text);
            BlocProvider.of<GaleriaBloc>(context).add(
              FetchGaleriaData(
                query: _queryController.text,
                startDate: _startDateController.text,
                endDate: _endDateController.text,
                mediaType: _selectedMediaType,
                numResults: numResults,
              ),
            );
            setState(() {
              _inputState = InputState.personalizedLoaded;
            });
          },
        );
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
              return DefaultInputWidget(galeriaData: state.galeriaData);
            } else if (state is GaleriaError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Estado desconocido'));
            }
          },
        );
      default:
        return Container();
    }
  }

  Widget buildInitialButtons() {
    return Center(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                setState(() {
                  _inputState = InputState.personalized;
                });
              },
              child: Text('Busqueda Personalizada'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                setState(() {
                  _inputState = InputState.defaultState;
                });
                BlocProvider.of<GaleriaBloc>(context).add(FetchGaleriaDefectoData());
              },
              child: Text('Búsqueda por Defecto'),
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

