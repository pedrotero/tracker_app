import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'actividades.g.dart';

@HiveType(typeId: 1)
class Actividades extends HiveObject {
  Actividades(
      {required this.date,
      required this.totdist,
      required this.recorr,
      required this.dur,
      required this.user,
      required this.tipo});

  @HiveField(0)
  DateTime date;
  @HiveField(1)
  double totdist;
  @HiveField(2)
  //{"lat": 394592, "lon": 92394}
  List<Map<String, double>> recorr;
  @HiveField(3)
  int dur;
  @HiveField(4)
  String user;
  @HiveField(5)
  String tipo;
}
