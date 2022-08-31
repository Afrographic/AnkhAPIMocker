import 'dart:developer';

import 'package:ankh_api_mocker/ankh_api_mocker.dart';
import 'package:ankh_api_mocker/user.dart';

void main() async {
  dynamic userJSON = await AnkhAPIMocker.generateData(
      fieldSchema: User.AnkhAPIMockerInit);
  print(userJSON);
}

// -- Example APP
// -- Deploy
// -- Youtube Video to demonstrate
// -- Flyer to present
// -- Publish
