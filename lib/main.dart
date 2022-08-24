import 'dart:developer';

import 'package:ankh_api_mocker/ankh_api_mocker.dart';

void main() {
  AnkhAPIMocker mocker = AnkhAPIMocker();
  mocker.generateData(User.AnkhAPIMockerInit);
}
