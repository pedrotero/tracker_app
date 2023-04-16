import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'segment.g.dart';

@HiveType(typeId: 2)
class segment extends HiveObject {
  segment({
    required this.nombre,
    required this.origen,
    required this.destino,
  });

  @HiveField(2)
  String nombre;
  @HiveField(0)
  double origen;
  @HiveField(1)
  double destino;
}
