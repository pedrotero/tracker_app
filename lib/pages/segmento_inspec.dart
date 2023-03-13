import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class SegmentoInspecWidget extends StatefulWidget {
  const SegmentoInspecWidget({
    Key? key,
    this.aaaaa,
  }) : super(key: key);

  final List<LatLng>? aaaaa;

  @override
  _SegmentoInspecWidgetState createState() => _SegmentoInspecWidgetState();
}

class _SegmentoInspecWidgetState extends State<SegmentoInspecWidget> {
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
                    '(Nombre del Segmento)',
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
                  'Tiempo promedio: (hh:mm:dd)',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'Tiempo récord: (hh:mm:dd)',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              // Expanded(
              //   child: FlutterFlowGoogleMap(
              //     controller: _model.googleMapsController,
              //     onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              //     initialLocation: _model.googleMapsCenter ??=
              //         LatLng(13.106061, -59.613158),
              //     markers: (widget.aaaaa ?? [])
              //         .map(
              //           (marker) => FlutterFlowMarker(
              //             marker.serialize(),
              //             marker,
              //           ),
              //         )
              //         .toList(),
              //     markerColor: GoogleMarkerColor.violet,
              //     mapType: MapType.normal,
              //     style: GoogleMapStyle.standard,
              //     initialZoom: 14.0,
              //     allowInteraction: true,
              //     allowZoom: true,
              //     showZoomControls: true,
              //     showLocation: true,
              //     showCompass: true,
              //     showMapToolbar: false,
              //     showTraffic: false,
              //     centerMapOnMarkerTap: true,
              //   ),
              // ),
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
}
