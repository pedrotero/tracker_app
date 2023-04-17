import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  group('Geolocation Tests', () {
    test('Calculate distance between two points', () async {
      final position1 = Position(
        latitude: 37.7749,
        longitude: -122.4194,
        altitude: 50.0,
        speed: 10.0,
        speedAccuracy: 1.0,
        heading: 90.0,
        accuracy: 5.0,
        timestamp: DateTime.now(),
      );

      final position2 = Position(
        latitude: 40.7128,
        longitude: -74.0060,
        altitude: 50.0,
        speed: 10.0,
        speedAccuracy: 1.0,
        heading: 90.0,
        accuracy: 5.0,
        timestamp: DateTime.now(),
      );

      final distance = await Geolocator.distanceBetween(
        position1.latitude,
        position1.longitude,
        position2.latitude,
        position2.longitude,
      );

      expect(distance, closeTo(4139.87, 20000));
    });
  });
}
