// ignore_for_file: unused_element

library ankh_api_mocker;

import 'dart:math' as math;

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

  String _randomStringGenerator() {
    if (_randomBoolGenerator()) return "Sekhmet";
    List<String> chars = ["Ankh", "Maat", "Amon", "Afro"];
    String suffix = "";
    suffix += chars[_randomIntGenerator(chars.length - 1)];
    return "Sekhmet-" + suffix;
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

  String _generateRandom(String dataType) {
    switch (dataType) {
      case "int":
        {
          return "${_randomIntGenerator(10000)}";
        }

      case "int?":
        {
          return "${_randomIntGenerator(10000)}";
        }

      case "String":
        {
          return _randomStringGenerator();
        }

      case "String?":
        {
          return _randomStringGenerator();
        }

      case "double":
        {
          return "${_randomDoubleGenerator()}";
        }

      case "double?":
        {
          return "${_randomDoubleGenerator()}";
        }

      case "bool":
        {
          return "${_randomBoolGenerator()}";
        }

      case "bool?":
        {
          return "${_randomBoolGenerator()}";
        }

      default:
        {
          return "-1";
        }
    }
  }

  List<Field> parseFieldStringToArray(String fieldsString) {
    List<Field> fields = [];

    return fields;
  }

  dynamic generateData(String fieldSchema) {
    fieldSchema = _removeAllLargeSpaces(fieldSchema);
    if (_validFieldsSchema(fieldSchema)) {
      String fields = _extractField(fieldSchema);
      print(fields);
    } else {
      throw Exception("Invalid Field Schema,Please check the documentation");
    }
  }
}

class Field {
  String dataType;
  String data;

  Field({required this.dataType, required this.data});
}

class User {
  int idUser;
  String name;
  String email;

  User({
    required this.idUser,
    required this.email,
    required this.name,
  });

  static String AnkhAPIMockerInit = """{
  int idUser;
  bool isOnline;
  double height;
  String fullName;
}""";
}
