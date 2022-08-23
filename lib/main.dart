import 'dart:developer';

import 'package:ankh_api_mocker/ankh_api_mocker.dart';

void main() {
  User user1 = User(
    idUser: 1,
    email: "bruneltesse@gmailcom",
    name: 'Afrographix',
  );

  AnkhAPIMocker mocker = AnkhAPIMocker();
  print(mocker.randomStringGenerator());

  // print(User.AnkhAPIMockerInit);

  // inspect(user1.)
}
