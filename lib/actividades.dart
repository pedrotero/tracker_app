import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'flutter_flow/flutter_flow_google_map.dart';

part 'actividades.g.dart';

@HiveType(typeId: 1)
class Actividades extends HiveObject {
  Actividades(
      {required this.date,
      required this.totdist,
      required this.recorr,
      required this.dur,
      required this.user});

  @HiveField(0)
  DateTime date;
  @HiveField(1)
  double totdist;
  @HiveField(2)
  List<Map<String, double>> recorr;
  @HiveField(3)
  int dur;
  @HiveField(4)
  String user;
}
