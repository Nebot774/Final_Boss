import 'package:flutter/material.dart';
import '../models/NeoWsData.dart';
import '../models/NeoWsNeoData.dart';
import '../repositories/NeoWsNeoRepository.dart';
import '../repositories/NeoWsRepository.dart';
import 'neo_ws_neo_data_widget.dart';
import 'neo_ws_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'neo_ws_neo_data_widget.dart';
import 'neo_ws_data_widget.dart';


class InicioWidget extends StatefulWidget {
  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  final NeoWsRepository _neoWsRepository = NeoWsRepository();
  final NeoWsNeoRepository _neoWsNeoRepository = NeoWsNeoRepository();

  bool _isPanel1Expanded = false;
  bool _isPanel2Expanded = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Theme(
              data: ThemeData(
                dividerColor: Colors.blue[900],
                expansionTileTheme: ExpansionTileThemeData(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              child: ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    if (index == 0) {
                      _isPanel1Expanded = !_isPanel1Expanded;
                    } else if (index == 1) {
                      _isPanel2Expanded = !_isPanel2Expanded;
                    }
                  });
                },
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.blue[900],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          'Buscar Asteroides por rango de fechas',
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      color: Colors.lightBlue[100],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _startDateController,
                              decoration: InputDecoration(
                                labelText: 'Fecha de inicio ',
                                labelStyle: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                hintText: '2023-05-01',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _endDateController,
                              decoration: InputDecoration(
                                labelText: 'Fecha fin ',
                                labelStyle: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                hintText: '2023-05-08',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            if (_errorMessage.isNotEmpty)
                              Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _errorMessage = '';
                                });

                                if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
                                  setState(() {
                                    _errorMessage = 'Las fechas no pueden estar vacías';
                                  });
                                  return;
                                }

                                try {
                                  DateTime startDate = DateFormat('yyyy-MM-dd').parse(_startDateController.text);
                                  DateTime endDate = DateFormat('yyyy-MM-dd').parse(_endDateController.text);

                                  if (endDate.difference(startDate).inDays > 7) {
                                    setState(() {
                                      _errorMessage = 'El rango de fechas no puede ser mayor a 7 días';
                                    });
                                    return;
                                  }

                                  NeoWsData data = await _neoWsRepository.fetchNeoWsData(_startDateController.text, _endDateController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NeoWsDataWidget(data),
                                  ));
                                } catch (e) {
                                  setState(() {
                                    _errorMessage = 'Error: $e';
                                  });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              ),
                              child: Text(
                                'Buscar',
                                style: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isExpanded: _isPanel1Expanded,
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.blue[900],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          'Buscar asteroides por ID',
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      color: Colors.lightBlue[100],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _idController,
                              decoration: InputDecoration(
                                labelText: 'ID ',
                                labelStyle: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                hintText: '3542519',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            if (_errorMessage.isNotEmpty)
                              Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _errorMessage = '';
                                });

                                if (_idController.text.isEmpty) {
                                  setState(() {
                                    _errorMessage = 'El ID no puede estar vacío';
                                  });
                                  return;
                                }

                                try {
                                  NeoWsNeoData data = await _neoWsNeoRepository.fetchNeoWsNeoData(_idController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NeoWsNeoDataWidget(data),
                                  ));
                                } catch (e) {
                                  setState(() {
                                    _errorMessage = 'Error: $e';
                                  });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              ),
                              child: Text(
                                'Buscar',
                                style: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isExpanded: _isPanel2Expanded,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

