import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:tracker_app/actividades.dart';
import 'package:vector_math/vector_math.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

class InActionWidget extends StatefulWidget {
  const InActionWidget({Key? key}) : super(key: key);

  @override
  _InActionWidgetState createState() => _InActionWidgetState();
}

class _InActionWidgetState extends State<InActionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final stopwatch = Stopwatch();
  double totdist = 0.0;
  late LatLng lastpos;
  String stopStr = '00:00:00 s';
  LatLng pos = LatLng(0, 0);
  Set<Polyline> _polyline = {};
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  final UserController boxcon = Get.find();

  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    stopwatch.start();
    // ignore: cancel_subscriptions, unused_local_variable
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      setState(() {
        if (pos != LatLng(0, 0)) {
          lastpos = pos;
          pos = _getLatLng(position);
          print("lastpos $lastpos pos $pos");
          totdist += distance(
              lastpos.latitude, lastpos.longitude, pos.latitude, pos.longitude);
        }
        print("alo manzana");
        pos = _getLatLng(position);
        _polyline.add(Polyline(
          polylineId: PolylineId('1'),
          points: [pos],
          color: Color.fromARGB(255, 94, 255, 83),
        ));
        print(_polyline);

        mapController?.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 18)
                //17 is new zoom level
                ));
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            'Activity',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 255, 255, 255),
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
              Expanded(
                  child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: GoogleMap(
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(11.011754, -74.831736), zoom: 12),
                  polylines: _polyline,
                ),
              )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.5, 0.0),
                      child: Text(
                        '${totdist.toInt()} m',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 30.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.5, 0.0, 0.0, 0.0),
                      child: Text(
                        Duration(seconds: stopwatch.elapsed.inSeconds)
                            .toString()
                            .substring(0, 10),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 30.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.5, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          stopwatch.stop();
                        },
                        text: 'Pausar',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(0, 0, 0, 0),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.5, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          addAct(Actividades(
                              date: DateTime.now(),
                              totdist: totdist,
                              recorr: _polyline,
                              dur: Duration(
                                  seconds: stopwatch.elapsed.inSeconds),
                              user: boxcon.loggedUser!));
                          context.pushNamed('Home');
                        },
                        text: 'Finalizar',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(0, 255, 255, 255),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int calculateDistance(double x1, double y1, double x2, double y2) {
    final dx = x2 - x1;
    final dy = y2 - y1;
    return sqrt(dx * dx + dy * dy).round();
  }

  _getLatLng(Position pos) {
    return LatLng(pos.latitude, pos.longitude);
  }

  double distance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // radius of the earth in kilometers
    var lat1Rad = radians(lat1);
    var lon1Rad = radians(lon1);
    var lat2Rad = radians(lat2);
    var lon2Rad = radians(lon2);
    var dLat = lat2Rad - lat1Rad;
    var dLon = lon2Rad - lon1Rad;
    var a = pow(sin(dLat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c * 1000; // distance in meters
    return d;
  }

  addAct(Actividades act) {
    Hive.box("users").add(act);
  }
}
