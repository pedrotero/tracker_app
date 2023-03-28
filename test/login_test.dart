import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  test('Comprobar si el usuario y la contraseña son correctos', () {
    var usercon = Usercon();
    var _controllerUser = TextEditingController(text: 'usuario1');
    var _controllerPass = TextEditingController(text: 'contraseña1');

    var tempUser = {
      "usuario": _controllerUser.text,
      "contraseña": _controllerPass.text
    };
    usercon.users = [
      {"usuario": "usuario1", "contraseña": "contraseña1"},
      {"usuario": "usuario2", "contraseña": "contraseña2"}
    ];

    expect(usercon.loggedUser, null);

    var userIndex = usercon.users.indexWhere((user) => mapEquals(
        {"usuario": user["usuario"], "contraseña": user["contraseña"]},
        tempUser));
    if (userIndex != -1) {
      usercon.loggedUser = usercon.users[userIndex];
    }

    expect(usercon.loggedUser,
        equals({"usuario": "usuario1", "contraseña": "contraseña1"}));
  });

  test(
      'Comprobar si el diálogo se muestra cuando el usuario o la contraseña son incorrectos',
      () {
    var usercon = Usercon();
    var _controllerUser = TextEditingController(text: 'usuario3');
    var _controllerPass = TextEditingController(text: 'contraseña3');

    var tempUser = {
      "usuario": _controllerUser.text,
      "contraseña": _controllerPass.text
    };
    usercon.users = [
      {"usuario": "usuario1", "contraseña": "contraseña1"},
      {"usuario": "usuario2", "contraseña": "contraseña2"}
    ];

    var userIndex = usercon.users.indexWhere((user) => mapEquals(
        {"usuario": user["usuario"], "contraseña": user["contraseña"]},
        tempUser));
    if (userIndex == -1) {
      var context;
      var alert = showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Usuario y/o contraseña incorrectos'),
            );
          });
      expect(alert, isA<AlertDialog>());
    }
  });
}

class Usercon {
  List<Map<String, String>> users = [];
  late Map<String, String> loggedUser;
}
