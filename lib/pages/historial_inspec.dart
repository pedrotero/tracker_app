import 'package:get/get.dart';

import '../main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistorialInspecWidget extends StatefulWidget {
  const HistorialInspecWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HistorialInspecWidgetState createState() => _HistorialInspecWidgetState();
}

class _HistorialInspecWidgetState extends State<HistorialInspecWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final UserController boxcon = Get.find();

  GoogleMapController? mapController;
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
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Actividad',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                  child: Text(
                    '(Hora inicio)',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  'Distancia recorrida: (m)',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'Duración: (hh:mm:ss)',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Expanded(
                child: GoogleMap(
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(11.011754, -74.831736), zoom: 12),
                  polylines: {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Set<Polyline> mapToPoly() {
    return {};
  }
}
