import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InActionWidget extends StatefulWidget {
  const InActionWidget({Key? key}) : super(key: key);

  @override
  _InActionWidgetState createState() => _InActionWidgetState();
}

class _InActionWidgetState extends State<InActionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

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
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(13.106061, -59.613158), zoom: 12),
                  markers: {
                    Marker(
                      markerId: MarkerId('marker_1'),
                      position: LatLng(37.7749, -122.4194),
                      infoWindow: InfoWindow(title: 'San Francisco'),
                    ),
                  },
                ),
              ),
              // Expanded(
              //   child: FlutterFlowGoogleMap(
              //     controller: _model.googleMapsController,
              //     onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              //     initialLocation: _model.googleMapsCenter ??=
              //         LatLng(13.106061, -59.613158),
              //     markerColor: GoogleMarkerColor.violet,
              //     mapType: MapType.normal,
              //     style: GoogleMapStyle.standard,
              //     initialZoom: 14.0,
              //     allowInteraction: true,
              //     allowZoom: true,
              //     showZoomControls: true,
              //     showLocation: true,
              //     showCompass: false,
              //     showMapToolbar: false,
              //     showTraffic: false,
              //     centerMapOnMarkerTap: true,
              //   ),
              // ),
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     FlutterFlowTimer(
              //       initialTime: _model.timerMilliseconds,
              //       getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
              //           value,
              //           milliSecond: false),
              //       timer: _model.timerController,
              //       updateStateInterval: Duration(milliseconds: 1000),
              //       onChanged: (value, displayTime, shouldUpdate) {
              //         _model.timerMilliseconds = value;
              //         _model.timerValue = displayTime;
              //         if (shouldUpdate) setState(() {});
              //       },
              //       textAlign: TextAlign.start,
              //       style: FlutterFlowTheme.of(context).bodyText1.override(
              //             fontFamily: 'Poppins',
              //             color: FlutterFlowTheme.of(context).primaryColor,
              //             fontSize: 30.0,
              //             fontWeight: FontWeight.normal,
              //           ),
              //     ),
              //     Padding(
              //       padding:
              //           EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              //       child: Text(
              //         '(distance)',
              //         style: FlutterFlowTheme.of(context).bodyText1.override(
              //               fontFamily: 'Poppins',
              //               fontSize: 30.0,
              //             ),
              //       ),
              //     ),
              //   ],
              // ),
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
                          print('Button pressed ...');
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.5, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
            ],
          ),
        ),
      ),
    );
  }
}
