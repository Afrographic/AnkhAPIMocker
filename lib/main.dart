import 'dart:developer';

import 'package:ankh_api_mocker/ankh_api_mocker.dart';
import 'package:ankh_api_mocker/user.dart';

void main() async {
  AnkhAPIMocker mocker = AnkhAPIMocker();
  dynamic userJSON =
      await mocker.generateData(fieldSchema: User.AnkhAPIMockerInit, count: 10);
  List<User> users = User.fromJSONArray(userJSON);
}

// -- Example APP
// -- Deploy
// -- Youtube Video to demonstrate
// -- Flyer to present
// -- Publish
