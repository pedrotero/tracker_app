import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../main.dart';
import '../segment.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class SegmentoInspecWidget extends StatefulWidget {
  const SegmentoInspecWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SegmentoInspecWidgetState createState() => _SegmentoInspecWidgetState();
}

class _SegmentoInspecWidgetState extends State<SegmentoInspecWidget> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Segmento',
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
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                  child: Text(
                    '${seg!.nombre}',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'Tiempo récord: ${Duration(milliseconds: seg!.record).toString().substring(0, 7)}',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(11.011754, -74.831736), zoom: 12),
                  markers: {
                    Marker(
                        markerId: MarkerId("${seg!.key}org"),
                        position: _decodeLatLng(seg!.origen),
                        icon: BitmapDescriptor.defaultMarkerWithHue(0)),
                    Marker(
                        markerId: MarkerId("${seg!.key}des"),
                        position: _decodeLatLng(seg!.destino),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue))
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('Segmentable');
                  },
                  text: 'Ver Tabla de Posiciones',
                  options: FFButtonOptions(
                    width: 258.0,
                    height: 47.8,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _decodeLatLng(Map<String, double> point) {
    return LatLng(point["lat"]!, point["long"]!);
  }
}
