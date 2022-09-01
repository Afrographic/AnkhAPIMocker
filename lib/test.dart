import 'package:ankh_api_mocker/ankh_api_mocker.dart';
import 'package:ankh_api_mocker/user.dart';

void main() async {
  dynamic usersArray =
      await AnkhAPIMocker.generateData(fieldSchema: User.AnkhAPIMockerInit,delayInSec: 5,count: 15);


}

// -- Example APP
// -- Deploy
// -- Youtube Video to demonstrate
// -- Flyer to present
// -- Publish
