import 'dart:developer';

import 'package:ankh_api_mocker/ankh_api_mocker.dart';
import 'package:ankh_api_mocker/user.dart';

void main() async {
  AnkhAPIMocker mocker = AnkhAPIMocker();
  var userJSON = await 
      mocker.generateData(fieldSchema: User.AnkhAPIMockerInit, delayInSec: 0);
  print(userJSON);
}

// -- Example APP
// -- Deploy
// -- Youtube Video to demonstrate
// -- Flyer to present
// -- Publish
