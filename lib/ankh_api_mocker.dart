// ignore_for_file: unused_element

library ankh_api_mocker;

import 'dart:collection';
import 'dart:math' as math;
import 'package:ankh_api_mocker/constant.dart';

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

class AnkhMocker {
  static int _randomIntGenerator(int max) {
    var random = math.Random();
    return random.nextInt(max);
  }

  static double _randomDoubleGenerator() {
    var random = math.Random();
    return double.parse((random.nextDouble() * 100).toStringAsFixed(2));
  }

  static bool _randomBoolGenerator() {
    var date = DateTime.now().millisecondsSinceEpoch;
    return date % 2 == 0;
  }

  static bool _validTextField(String fieldName) {
    final requiredFieldSchema = RegExp(r'.*len.+');
    return requiredFieldSchema.hasMatch(fieldName);
  }

  static String _stringGeneratorPicker(String fieldName) {
    if (_validTextField(fieldName)) {
      return _generateRandomText(fieldName);
    }
    if (fieldName.toLowerCase().contains("date")) {
      return _generateDate();
    }
    if (fieldName.toLowerCase().contains("avatar")) {
      return _generateRandomAvatar();
    }
    if (fieldName.toLowerCase().contains("image")) {
      return _generateRandomImage();
    }
    if (_randomBoolGenerator()) return "Sekhmet";
    return _randomStringGenerator();
  }

  static String _generateDate() {
    int monthIndex = _randomIntGenerator(months.length - 1);
    String year = (DateTime.now().year).toString();
    return "${_randomIntGenerator(28)} ${months[monthIndex]}. $year";
  }

  static String _generateRandomText(String fieldName) {
    List<String> splittedString = fieldName.split("len");
    int textLeng = int.parse(splittedString[1]);
    return generateText(textLeng);
  }

  static String _randomStringGenerator() {
    List<String> chars = ["Ankh", "Maat", "Amon", "Afro"];
    String suffix = "";
    suffix += chars[_randomIntGenerator(chars.length - 1)];
    return "Sekhmet-" + suffix;
  }

  static String _generateRandomAvatar() {
    int index = _randomIntGenerator(avatars.length - 1);
    return avatars[index];
  }

  static String _generateRandomImage() {
    int index = _randomIntGenerator(images.length - 1);
    return images[index];
  }

  static String _removeAllLargeSpaces(String fieldSchema) {
    fieldSchema = fieldSchema.trim();
    fieldSchema = fieldSchema.replaceAllMapped(RegExp(r'\s+'), (match) {
      return " ";
    });
    return fieldSchema;
  }

  static bool _validFieldsSchema(String fieldSchema) {
    final requiredFieldSchema =
        RegExp(r'{\s*((int|bool|String|double)\??\s+\S+\s*;\s+)+\s*}');
    return requiredFieldSchema.hasMatch(fieldSchema);
  }

  static String _extractField(String fieldSchema) {
    final regExp = RegExp(r'{(.+)}');
    final match = regExp.firstMatch(fieldSchema);
    return match?.group(1) as String;
  }

  static dynamic _generateRandom(Field field) {
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
          return _stringGeneratorPicker(field.fieldName);
        }

      case "String?":
        {
          return _stringGeneratorPicker(field.fieldName);
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

  static List<Field> _parseFieldStringToArray(String fieldsString) {
    List<Field> fields = [];
    fieldsString = fieldsString.substring(0, fieldsString.length - 2);
    List<String> fieldsStringArray = fieldsString.split(";");
    for (var fieldString in fieldsStringArray) {
      fields.add(_buildField(fieldString));
    }
    return fields;
  }

  static Field _buildField(String fieldString) {
    fieldString = fieldString.trim();
    List<String> splitted = fieldString.split(" ");
    return Field(fieldType: splitted[0], fieldName: splitted[1]);
  }

  static dynamic _buildRandomData(List<Field> fields) {
    final Map<String, dynamic> data = HashMap();
    for (var field in fields) {
      data.addAll({field.fieldName: _generateRandom(field)});
    }
    return data;
  }

  static dynamic _buildMultipleRandomData(List<Field> fields, int count) {
    final List<Map<String, dynamic>> data = [];
    for (int i = 0; i <= count; i++) {
      var dataItem = _buildRandomData(fields);
      data.add(dataItem);
    }
    return data;
  }

  static String generateDate() {
    return _generateDate();
  }

  static List<String> generateDateList(int count) {
    List<String> data = [];
    if (count > 0) {
      for (int i = 0; i <= count; i++) {
        data.add(_generateDate());
      }
    } else {
      data.add(_generateDate());
    }
    return data;
  }

  static String generateAvatarURL() {
    return _generateRandomAvatar();
  }

  static List<String> generateAvatarURLList(int count) {
    List<String> data = [];
    if (count > 0) {
      for (int i = 0; i <= count; i++) {
        data.add(_generateRandomAvatar());
      }
    } else {
      data.add(_generateRandomAvatar());
    }
    return data;
  }

  static String generateRandomImageURL() {
    return _generateRandomImage();
  }

  static List<String> generateImageURLList(int count) {
    List<String> data = [];
    if (count > 0) {
      for (int i = 0; i <= count; i++) {
        data.add(_generateRandomImage());
      }
    } else {
      data.add(_generateRandomImage());
    }
    return data;
  }

  static List<int> generateIntList(int count) {
    List<int> data = [];
    if (count > 0) {
      for (int i = 0; i <= count; i++) {
        data.add(_randomIntGenerator(50));
      }
    } else {
      data.add(_randomIntGenerator(50));
    }
    return data;
  }

  static String generateText(int totalWords) {
    String text = "";
    while (text.length < totalWords) {
      int index = _randomIntGenerator(images.length - 1);
      text += words[index] + " ";
    }
    return text.substring(0, totalWords);
  }

  static dynamic generateData(
      {required String fieldSchema,
      int? delayInSec = 1,
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
