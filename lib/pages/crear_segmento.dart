import 'package:get/get.dart';
import 'package:tracker_app/main.dart';
import 'package:tracker_app/segment.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

class CrearSegmentoWidget extends StatefulWidget {
  const CrearSegmentoWidget({Key? key}) : super(key: key);

  @override
  _CrearSegmentoWidgetState createState() => _CrearSegmentoWidgetState();
}

class _CrearSegmentoWidgetState extends State<CrearSegmentoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final UserController boxcon = Get.find();
  int markeropt = 0;
  LatLng orglatlng = LatLng(0, 0);
  LatLng deslatlng = LatLng(0, 0);
  String orgtext = "";
  String destext = "";
  TextEditingController _controllerNombre = TextEditingController();

  @override
  void initState() {
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
          'Crear Segmento',
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 20.0, 20.0),
              child: TextButton(
                child: Text(
                  "Origen: $orgtext",
                  style: TextStyle(color: Color.fromARGB(172, 255, 56, 56)),
                ),
                onPressed: () {
                  setState(() {
                    markeropt = 1;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 20.0, 20.0),
              child: TextButton(
                child: Text(
                  "Destino: $destext",
                  style: TextStyle(color: Color.fromARGB(172, 56, 119, 255)),
                ),
                onPressed: () {
                  setState(() {
                    markeropt = 2;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 20.0, 20.0),
              child: TextField(
                autofocus: false,
                controller: _controllerNombre,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Nombre del segmento',
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4500FF),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(11.011754, -74.831736), zoom: 19),
                onTap: (LatLng location) {
                  setState(() {
                    if (markeropt == 1) {
                      orglatlng = location;
                      orgtext = location.toString();
                    } else if (markeropt == 2) {
                      deslatlng = location;
                      destext = location.toString();
                    }
                  });
                },
                markers: {
                  Marker(
                      markerId: MarkerId("origen"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed),
                      position: orglatlng),
                  Marker(
                      markerId: MarkerId("destino"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueBlue),
                      position: deslatlng),
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (orgtext != "" && destext != "") {
                    addSeg(Segment(
                        nombre: _controllerNombre.text,
                        origen: {
                          "lat": orglatlng.latitude,
                          "long": orglatlng.longitude
                        },
                        destino: {
                          "lat": deslatlng.latitude,
                          "long": deslatlng.longitude
                        },
                        record: 0));
                    context.pushNamed('Segmentos');
                  }
                },
                text: 'Crear',
                options: FFButtonOptions(
                  width: 249.7,
                  height: 50.0,
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
      )),
    );
  }

  addSeg(Segment seg) {
    Hive.box("segment").add(seg);
    print(boxcon.boxes![2].values);
  }
}
