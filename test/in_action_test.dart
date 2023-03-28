import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracker_app/pages/in_action.dart';

void main() {
  group('calculateDistance', () {
    test('Distance should be 0.12 km', () {
      final distance = calculateDistance(
          37.7749 as LatLng, (-122.4194) as LatLng, 37.7833, -122.4167);
      expect(distance.toStringAsFixed(2), '0.12');
    });
  });
}
