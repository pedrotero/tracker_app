import 'package:get/get.dart';

import '../main.dart';
import '../segment.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class SegmentableWidget extends StatefulWidget {
  const SegmentableWidget({Key? key}) : super(key: key);

  @override
  _SegmentableWidgetState createState() => _SegmentableWidgetState();
}

class _SegmentableWidgetState extends State<SegmentableWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final UserController boxcon = Get.find();
  Segment? seg;
  @override
  void initState() {
    seg = boxcon.boxes![2].values
        .toList()
        .firstWhere((seg) => seg.key == boxcon.keySeg);
    super.initState();
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
                    '${seg!.nombre}',
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
                    return DataTable2(
                      columns: [
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Usuario',
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
                      rows: boxcon.boxes![3].values
                          .toList()
                          .where((lead) => lead.segment == seg!.key)
                          .map((lead) {
                        return DataRow(
                          cells: [
                            DataCell(Text(
                              lead.user,
                              textAlign: TextAlign.center,
                              textScaleFactor: 0.9,
                            )),
                            DataCell(Text(
                              Duration(milliseconds: lead.dur).toString(),
                              textAlign: TextAlign.end,
                            )),
                          ],
                        );
                      }).toList(),
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
