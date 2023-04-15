import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:tracker_app/actividades.dart';
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
  Timer? _timer;
  StreamSubscription<Position>? _positionStream;
  late LatLng lastpos;
  LatLng pos = LatLng(0, 0);
  List<LatLng> points = [];
  Set<Polyline> _polylines = {};
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
    _positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      setState(() {
        if (pos != LatLng(0, 0)) {
          lastpos = pos;
          pos = _getLatLng(position);
          totdist += Geolocator.distanceBetween(
              lastpos.latitude, lastpos.longitude, pos.latitude, pos.longitude);
        }
        pos = _getLatLng(position);
        points.add(pos);
        _polylines.add(Polyline(
          polylineId: PolylineId('1'),
          points: points,
          color: Colors.green,
        ));
        mapController?.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 18)
                //17 is new zoom level
                ));
      });
    });
    _timer = new Timer.periodic(new Duration(milliseconds: 500), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    _positionStream!.cancel();
    super.dispose();
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
                child: GoogleMap(
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(11.011754, -74.831736), zoom: 12),
                  polylines: _polylines,
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
                        "${Duration(milliseconds: stopwatch.elapsed.inMilliseconds).toString().substring(0, 7)} s",
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
                              recorr: _encodeRecorr(points),
                              dur: stopwatch.elapsed.inMilliseconds,
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

  addAct(Actividades act) {
    Hive.box("actividades").add(act);
  }

  List<Map<String, double>> _encodeRecorr(List<LatLng> points) {
    return points
        .map((point) => {"lat": point.latitude, "long": point.longitude})
        .toList();
  }
}
