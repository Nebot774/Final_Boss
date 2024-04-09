import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';

// Asegúrate de tener las siguientes clases definidas en tu proyecto
import 'package:final_boss/bloc/ui/pages/rovers/curiosity/curiosity_rover_api.dart'; // Reemplaza con la ruta correcta a tu pantalla del rover
import 'package:final_boss/bloc/ui/pages/rovers/curiosity/inf_curiosity.dart';  // Reemplaza con la ruta correcta a tu pantalla de información

class CuriosityPage extends StatefulWidget {
  @override
  _CuriosityPageState createState() => _CuriosityPageState();
}

class _CuriosityPageState extends State<CuriosityPage> {
  int _selectedIndex = 0; // Indice para saber qué pantalla mostrar

  // Lista de widgets para navegar
  final List<Widget> _pages = [
    CuriosityRover(), // Pantalla del rover
    InformationCuriosity(), // Pantalla de información
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Cambia el color del icono a blanco
        title: Padding(
          padding: EdgeInsets.only(left: 0.0), // Añade margen a la izquierda del título
          child: Text(
            'Curiosity',
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
      body: Container(
        color: Colors.black, // Cambia el color de fondo a negro
        child: _pages.elementAt(_selectedIndex), // Mostrar la pantalla seleccionada
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red, // Cambia el color de fondo del menú de navegación a rojo
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: 'Rover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Información',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}