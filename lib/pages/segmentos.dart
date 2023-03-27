import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class SegmentosWidget extends StatefulWidget {
  const SegmentosWidget({Key? key}) : super(key: key);

  @override
  _SegmentosWidgetState createState() => _SegmentosWidgetState();
}

class _SegmentosWidgetState extends State<SegmentosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('CrearSegmento');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8.0,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryBtnText,
          size: 30.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Segmentos',
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
                      return DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Nombre',
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
                                'Origen y Destino',
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
                                'Tiempo Récord',
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
                              DataCell(Text('Malecon')),
                              DataCell(Text('2km')),
                              DataCell(InkWell(
                                  child: Text('Ver'),
                                  onTap: () async {
                                    context.pushNamed('SegmentoInspec');
                                  })),
                              DataCell(Text('12:00')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Malecon')),
                              DataCell(Text('2km')),
                              DataCell(InkWell(
                                  child: Text('Ver'),
                                  onTap: () async {
                                    context.pushNamed('SegmentoInspec');
                                  })),
                              DataCell(Text('12:00')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Malecon')),
                              DataCell(Text('2km')),
                              DataCell(InkWell(
                                  child: Text('Ver'),
                                  onTap: () async {
                                    context.pushNamed('SegmentoInspec');
                                  })),
                              DataCell(Text('12:00')),
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
