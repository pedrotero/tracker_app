import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'users.g.dart';

@HiveType(typeId: 0)
class Users extends HiveObject {
  Users({
    required this.name,
    required this.password,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String password;
}
