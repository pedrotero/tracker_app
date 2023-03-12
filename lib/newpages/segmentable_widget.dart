import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'segmentable_model.dart';
export 'segmentable_model.dart';

class SegmentableWidget extends StatefulWidget {
  const SegmentableWidget({Key? key}) : super(key: key);

  @override
  _SegmentableWidgetState createState() => _SegmentableWidgetState();
}

class _SegmentableWidgetState extends State<SegmentableWidget> {
  late SegmentableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SegmentableModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Posiciones',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Text(
                    '(Nombre del Segmento)',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final rarara = List.generate(
                        random_data.randomInteger(0, 0),
                        (index) => random_data.randomInteger(0, 10)).toList();
                    return DataTable2(
                      columns: [
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Fecha',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Tiempo',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                            ),
                          ),
                        ),
                      ],
                      rows: rarara
                          .mapIndexed((rararaIndex, rararaItem) => [
                                Text(
                                  'Edit Column 1',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                                Text(
                                  'Edit Column 2',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ].map((c) => DataCell(c)).toList())
                          .map((e) => DataRow(cells: e))
                          .toList(),
                      headingRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      headingRowHeight: 56.0,
                      dataRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      dataRowHeight: 56.0,
                      border: TableBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      dividerThickness: 1.0,
                      showBottomBorder: false,
                      minWidth: 49.0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
