import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tracker_app/actividades.dart';
import 'package:tracker_app/segment.dart';
import 'package:tracker_app/users.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';

void main() async {
  Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Geolocator.requestPermission();
  UserController controller = Get.put(UserController());
  controller.boxes = await _openBoxes();
  runApp(MyApp());
}

Future<List<Box>> _openBoxes() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  Hive.registerAdapter(ActividadesAdapter());
  Hive.registerAdapter(SegmentAdapter());
  return [
    await Hive.openBox("users"),
    await Hive.openBox("actividades"),
    await Hive.openBox("segment")
  ];
}

class UserController extends GetxController {
  //boxes: 0 users, 1 actividades
  List<Box>? boxes;
  String? loggedUser;
  String? tipo;
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'TrackerApp',
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
