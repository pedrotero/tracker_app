import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'segment.g.dart';

@HiveType(typeId: 2)
class Segment extends HiveObject {
  Segment(
      {required this.nombre,
      required this.origen,
      required this.destino,
      required this.record});

  @HiveField(0)
  Map<String, double> origen;
  @HiveField(1)
  Map<String, double> destino;
  @HiveField(2)
  String nombre;
  @HiveField(3)
  int record;
}
