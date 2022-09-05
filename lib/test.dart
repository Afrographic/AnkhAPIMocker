// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:ankh_api_mocker/ankh_api_mocker.dart';
import 'package:ankh_api_mocker/user.dart';
import 'package:flutter/material.dart';

void main() async {
  // ignore: unused_local_variable
  // List<User> users = [
  //   User(idUser: 1,fullName: 'Maat',isOnline: false),
  //   User(idUser: 1,fullName: 'Afro',isOnline: false),
  //   User(idUser: 2,fullName: 'Horus',isOnline: true),
  //   User(idUser: 3,fullName: 'Amon Ra',isOnline: false),
  //   User(idUser: 4,fullName: 'Sematawy',isOnline: false),
  //   User(idUser: 4,fullName: 'Sematawy',isOnline: false),
  // ];

  dynamic usersJSON = await AnkhMocker.generateData(
    fieldSchema: User.AnkhMockerInit,
    delayInSec: 3,
    count: 6,
  );
  List<User> users = User.fromJSONArray(usersJSON);

  String myText = AnkhMocker.generateRandomImageURL();

  // Widget description = Text("asjdjas djasjdjas djasjd asjdjas djasjd asjdjas djasjdjas dasjdjas djsdjajsd ajsdjajsd ajsjda sdjajsd asjdjas djasjkdhjas hdajksdh kajsdhakjs dkjash djkahsjdhkajshdkajs jkdahskjhdkja sjkdhkjashdkajsh akjsdhakjshd kaskdh aksdh aksdh askdjhaksjdh akjsdhakhsj hdaksdhkajshd asdhkjashdk askjdhkjash akjsdh kjash akjsdhkajs dkajshd akjshdk jasdkjas dkahs daksdhaksdkhasdhaks daks dsd");

  Widget description = Text(AnkhMocker.generateText(200));


}
