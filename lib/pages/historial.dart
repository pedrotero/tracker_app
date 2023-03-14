import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistorialWidget extends StatefulWidget {
  const HistorialWidget({Key? key}) : super(key: key);

  @override
  _HistorialWidgetState createState() => _HistorialWidgetState();
}

class _HistorialWidgetState extends State<HistorialWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  int randomIndex = 3;
  int randomItem = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Historial de actividades',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final random = List.generate(
                          random_data.randomInteger(0, 0),
                          (index) => random_data.randomInteger(0, 10)).toList();
                      return DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Fecha',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Distancia Bruta',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Recorrido',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Duración',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('20/03/2023')),
                              DataCell(Text('5km')),
                              DataCell(InkWell(
                                  child: Text('Ver'),
                                  onTap: () async {
                                    context.pushNamed('HistorialInspec');
                                  })),
                              DataCell(Text('30:00')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('20/03/2023')),
                              DataCell(Text('5km')),
                              DataCell(InkWell(
                                  child: Text('Ver'),
                                  onTap: () async {
                                    context.pushNamed('HistorialInspec');
                                  })),
                              DataCell(Text('30:00')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('20/03/2023')),
                              DataCell(Text('5km')),
                              DataCell(InkWell(
                                  child: Text('Ver'),
                                  onTap: () async {
                                    context.pushNamed('HistorialInspec');
                                  })),
                              DataCell(Text('30:00')),
                            ],
                          ),
                        ],
                        headingRowColor: MaterialStateProperty.all(
                          Color(0xFF464646),
                        ),
                        headingRowHeight: 56.0,
                        dataRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        dataRowHeight: 56.0,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        dividerThickness: 1.0,
                        columnSpacing: 2.0,
                        showBottomBorder: true,
                        minWidth: 49.0,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
