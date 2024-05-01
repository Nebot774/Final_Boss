import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/blocs/imagen_cumpleanos_bloc.dart';
import '../../bloc/events/imagen_cumpleanos_event.dart';
import '../../bloc/states/imagen_cumpleanos_state.dart';

class DiaCumple extends StatefulWidget {
  @override
  _DiaCumpleState createState() => _DiaCumpleState();
}

class _DiaCumpleState extends State<DiaCumple> {
  final _fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imagenCumpleanosBloc = BlocProvider.of<ImagenCumpleanosBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Día Cumple'),
      ),
      body: BlocBuilder<ImagenCumpleanosBloc, ImagenCumpleanosState>(
        builder: (context, state) {
          if (state is ImagenCumpleanosInitial) {
            return Column(
              children: [
                Text(
                  'Introduce la fecha de tu cumpleaños',
                  style: TextStyle(
                    fontFamily: 'Exo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextField(
                  controller: _fechaController,
                  decoration: InputDecoration(
                    hintText: 'YYYY-MM-DD',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    imagenCumpleanosBloc.add(FetchImagenCumpleanos(fecha: _fechaController.text));
                  },
                  child: Text(
                    'Explorar',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]!),
                  ),
                )
              ],
            );
          } else if (state is ImagenCumpleanosLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ImagenCumpleanosLoaded) {
            return Container(
              color: Colors.black,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Text('${state.apodData.title ?? 'No disponible'}', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
                  Text('Fecha: ${state.apodData.date ?? 'No disponible'}', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.black,
                              body: Center(
                                child: CachedNetworkImage(
                                  imageUrl: state.apodData.url!,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Icon(Icons.error), SizedBox(height: 10), Text('Error al cargar la imagen.')],
                                  ),
                                ),
                              ),
                              floatingActionButton: FloatingActionButton(
                                child: Icon(Icons.close, color: Colors.white), // Cambia el ícono a una "X"
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              floatingActionButtonLocation: FloatingActionButtonLocation.endTop, // Mueve el botón a la derecha
                            ),
                          ));
                        },
                        child: CachedNetworkImage(
                          imageUrl: state.apodData.url!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.error), SizedBox(height: 15), Text('Error al cargar la imagen.')],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
                      children: [
                        Text('Tipo de medio:', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0)),
                        Text('${state.apodData.mediaType ?? 'No disponible'}', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', color: Colors.white, fontSize: 14.0)),
                        Text('Versión del servicio:', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0)),
                        Text('${state.apodData.serviceVersion ?? 'No disponible'}', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', color: Colors.white, fontSize: 14.0)),
                        Text('Explicación:', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
                        Text(
                          '${state.apodData.explanation ?? 'No disponible'}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 6.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ImagenCumpleanosError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Estado desconocido'));
          }
        },
      ),
    );
  }
}