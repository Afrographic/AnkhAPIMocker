// ignore_for_file: unused_element

library ankh_api_mocker;

import 'dart:collection';
import 'dart:developer';
import 'dart:math' as math;

import 'package:ankh_api_mocker/images.dart';

/*
Author : Afrographix
This package helps you to mock an API response

for example

-----
Input
-----
{
  int idUser;
  bool isOnline;
  double height;
  String fullName;
}

------
Output
------
{
  idUser:1,
  isOnline:false,
  height:1.45,
  fullName:"Sekhmet"
}
*/

/// A Calculator.
class AnkhAPIMocker {
  int _randomIntGenerator(int max) {
    var random = math.Random();
    return random.nextInt(max);
  }

  double _randomDoubleGenerator() {
    var random = math.Random();
    return double.parse((random.nextDouble() * 100).toStringAsFixed(2));
  }

  bool _randomBoolGenerator() {
    var date = DateTime.now().millisecondsSinceEpoch;
    return date % 2 == 0;
  }

  String _randomStringGenerator(String fieldName) {
    if (fieldName.toLowerCase().contains("avatar")) {
      return _generateRandomAvatar();
    }
    if (fieldName.toLowerCase().contains("image")) {
      return _generateRandomImage();
    }
    if (_randomBoolGenerator()) return "Sekhmet";
    List<String> chars = ["Ankh", "Maat", "Amon", "Afro"];
    String suffix = "";
    suffix += chars[_randomIntGenerator(chars.length - 1)];
    return "Sekhmet-" + suffix;
  }

  String _generateRandomAvatar() {
    int index = _randomIntGenerator(avatars.length - 1);
    return avatars[index];
  }

  String _generateRandomImage() {
    int index = _randomIntGenerator(images.length - 1);
    return images[index];
  }

  String _removeAllLargeSpaces(String fieldSchema) {
    fieldSchema = fieldSchema.trim();
    fieldSchema = fieldSchema.replaceAllMapped(RegExp(r'\s+'), (match) {
      return " ";
    });
    return fieldSchema;
  }

  bool _validFieldsSchema(String fieldSchema) {
    final requiredFieldSchema =
        RegExp(r'{\s*((int|bool|String|double)\??\s+\S+\s*;\s+)+\s*}');
    return requiredFieldSchema.hasMatch(fieldSchema);
  }

  String _extractField(String fieldSchema) {
    final regExp = RegExp(r'{(.+)}');
    final match = regExp.firstMatch(fieldSchema);
    return match?.group(1) as String;
  }

  dynamic _generateRandom(Field field) {
    switch (field.fieldType) {
      case "int":
        {
          return _randomIntGenerator(10000);
        }

      case "int?":
        {
          return _randomIntGenerator(10000);
        }

      case "String":
        {
          return _randomStringGenerator(field.fieldName);
        }

      case "String?":
        {
          return _randomStringGenerator(field.fieldName);
        }

      case "double":
        {
          return _randomDoubleGenerator();
        }

      case "double?":
        {
          return _randomDoubleGenerator();
        }

      case "bool":
        {
          return _randomBoolGenerator();
        }

      case "bool?":
        {
          return _randomBoolGenerator();
        }

      default:
        {
          return -1;
        }
    }
  }

  List<Field> _parseFieldStringToArray(String fieldsString) {
    List<Field> fields = [];
    fieldsString = fieldsString.substring(0, fieldsString.length - 2);
    List<String> fieldsStringArray = fieldsString.split(";");
    for (var fieldString in fieldsStringArray) {
      fields.add(_buildField(fieldString));
    }
    return fields;
  }

  Field _buildField(String fieldString) {
    fieldString = fieldString.trim();
    List<String> splitted = fieldString.split(" ");
    return Field(fieldType: splitted[0], fieldName: splitted[1]);
  }

  dynamic _buildRandomData(List<Field> fields) {
    final Map<String, dynamic> data = HashMap();
    for (var field in fields) {
      data.addAll({field.fieldName: _generateRandom(field)});
    }
    return data;
  }

  dynamic _buildMultipleRandomData(List<Field> fields, int count) {
    final List<Map<String, dynamic>> data = [];
    for (int i = 0; i <= count; i++) {
      var dataItem = _buildRandomData(fields);
      data.add(dataItem);
    }
    return data;
  }

  dynamic generateData(
      {required String fieldSchema,
      int? delayInSec = 0,
      int? count = 0}) async {
    await Future.delayed(Duration(seconds: delayInSec as int));
    fieldSchema = _removeAllLargeSpaces(fieldSchema);
    if (_validFieldsSchema(fieldSchema)) {
      String fields = _extractField(fieldSchema);
      List<Field> fieldList = _parseFieldStringToArray(fields);
      if (count! > 1) {
        return _buildMultipleRandomData(fieldList, count);
      } else {
        return _buildRandomData(fieldList);
      }
    } else {
      throw Exception("Invalid Field Schema,Please check the documentation");
    }
  }
}

class Field {
  String fieldType;
  String fieldName;

  Field({required this.fieldType, required this.fieldName});
}
