import 'dart:async';
import 'package:get/get.dart';
import 'package:tracker_app/actividades.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracker_app/leaderboard.dart';
import '../main.dart';
import '../segment.dart';
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
  List<Marker> markers = [];
  List<Map<String, dynamic>> suscritos = [];
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
    markers.addAll(boxcon.boxes![2].values
        .toList()
        .map((e) => [
              Marker(
                  markerId: MarkerId("${e.key}org"),
                  position: _decodeLatLng(e.origen),
                  icon: BitmapDescriptor.defaultMarkerWithHue(e.key * 18.0)),
              Marker(
                  markerId: MarkerId("${e.key}des"),
                  position: _decodeLatLng(e.destino),
                  icon: BitmapDescriptor.defaultMarkerWithHue(e.key * 18.0))
            ])
        .expand((list) => list));
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
        suscritos = _checkAddSegment(suscritos, pos);
        List<Map<String, dynamic>> segclear =
            _checkClearSegment(suscritos, pos);
        for (Map sus in segclear) {
          print("polo");
          var seg = sus["seg"];
          num time = stopwatch.elapsedMilliseconds - sus["time"];
          seg.record = seg.record < time && seg.record > 0
              ? seg.record
              : stopwatch.elapsedMilliseconds;
          addLeaderBoard(Leaderboard(
              dur: time.toInt(), user: boxcon.loggedUser!, segment: seg.key));
          suscritos.remove(sus);
        }

        print("alo manzana");
        print("pipo$suscritos");
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
                  markers: markers.toSet(),
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
                        "${Duration(milliseconds: stopwatch.elapsed.inMilliseconds).toString().substring(0, 7)}",
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
                              user: boxcon.loggedUser!,
                              tipo: boxcon.tipo!));
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

  _getLatLng(Position pos) {
    return LatLng(pos.latitude, pos.longitude);
  }

  addAct(Actividades act) {
    Hive.box("actividades").add(act);
    print(boxcon.boxes![1].values);
  }

  List<Map<String, double>> _encodeRecorr(List<LatLng> points) {
    return points
        .map((point) => {"lat": point.latitude, "long": point.longitude})
        .toList();
  }

  _decodeLatLng(Map<String, double> point) {
    return LatLng(point["lat"]!, point["long"]!);
  }

  List<Map<String, dynamic>> _checkAddSegment(
      List<Map<String, dynamic>> list, LatLng pos) {
    for (Segment seg in boxcon.boxes![2].values.toList()) {
      if (Geolocator.distanceBetween(pos.latitude, pos.longitude,
              seg.origen["lat"]!, seg.origen["long"]!) <=
          7.5) {
        // ignore: unnecessary_null_comparison
        // if (list.isNotEmpty) {
        //   if (!(list.lastWhere((sus) => sus["seg"].key == seg.key,
        //           orElse: null) !=
        //       null)) {
        //     list.add({"seg": seg, "time": stopwatch.elapsed});
        //     print('wah $list');
        //   } else {
        //     print("duplicate segment");
        //   }
        // }
        list.add({"seg": seg, "time": stopwatch.elapsedMilliseconds});
      }
    }
    return list;
  }

  List<Map<String, dynamic>> _checkClearSegment(
      List<Map<String, dynamic>> list, LatLng pos) {
    List<Map<String, dynamic>> segclear = [];
    for (Map<String, dynamic> sus in list) {
      if (Geolocator.distanceBetween(pos.latitude, pos.longitude,
              sus["seg"].destino["lat"]!, sus["seg"].destino["long"]!) <=
          7.5) {
        segclear.add(sus);
        print('bih$segclear');
      }
    }
    return segclear;
  }

  addLeaderBoard(Leaderboard lead) {
    Hive.box("leaderboard").add(lead);
    print(boxcon.boxes![3].values);
  }
}
