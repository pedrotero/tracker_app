import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'leaderboard.g.dart';

@HiveType(typeId: 3)
class Leaderboard extends HiveObject {
  Leaderboard({required this.dur, required this.user, required this.segment});

  @HiveField(0)
  int dur;
  @HiveField(1)
  String user;
  @HiveField(2)
  int segment;
}
