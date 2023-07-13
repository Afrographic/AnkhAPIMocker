// ignore_for_file: unused_element

library ankh_api_mocker;

import 'dart:math' as math;

/*
Author : Afrographix Studio
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
        RegExp(r'\s*((int|bool|String|double)\??\s+\S+\s*;\s+)+\s*');
    return requiredFieldSchema.hasMatch(fieldSchema);
  }

  static dynamic _generateRandom(Field field) {
    switch (field.fieldType) {
      case "int":
        {
          return _randomIntGenerator(100);
        }

      case "int?":
        {
          return _randomIntGenerator(100);
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
    fieldsString = fieldsString.trim();
    List<Field> fields = [];
    fieldsString = fieldsString.substring(0, fieldsString.length - 1);
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
    final Map<String, dynamic> data = {};
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
      List<Field> fieldList = _parseFieldStringToArray(fieldSchema);
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

List<String> avatars = [
  "https://image.shutterstock.com/image-vector/ankh-icon-symbol-design-religion-260nw-1216206289.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp86_1pBkW167h0tLDXu2QfpHns8CdJUXdLQ&usqp=CAU",
  "https://c8.alamy.com/compfr/had3rt/ankh-egyptienne-d-or-avec-des-ailes-brillantes-sur-un-fond-noir-symbole-magique-had3rt.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbj_IrNL12E-M1Wub43wxkj-v3hjAmfNVKfHwRaLBKU8tR0ilJdVzF_D-3facaRoPikHQ&usqp=CAU",
  "https://img.freepik.com/vecteurs-premium/oeil-horus_71843-10.jpg?w=2000",
  "https://image.shutterstock.com/image-illustration/horus-eye-falcon-god-feathers-260nw-291644468.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbwM94ihhDFp9fygyl19ZvVgHFUoC2HVL7-x60LZwfmx1kBZI7wL-IYuj5O0yn39jeShg&usqp=CAU",
  "https://image.shutterstock.com/image-vector/animation-color-portrait-ancient-egyptian-260nw-1930432121.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_gUJuziSdXC6tC0nyJ0QtU_RhXdhsV5Ba150yOKqczjbviCgtdB95X4zS9k01G88Fp4w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLDmS3DIr8Wt2YTpy09xTToQXJ0M1yi5plAA&usqp=CAU",
  "https://image.shutterstock.com/image-vector/animation-linear-portrait-sitting-goddess-260nw-1975463477.jpg",
  "https://image.shutterstock.com/image-vector/animation-linear-portrait-sitting-goddess-260nw-1975463480.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbisiswjcySFGu5P9uLHBhaX6RVd6TDLe_oW6uEBAN9xfdkVfLgqtQKzsbotsLri5ZBQk&usqp=CAU",
  "https://m.media-amazon.com/images/I/71IokNuu2PL._AC_SX466_.jpg"
];

List<String> images = [
  "https://afrikhepri.org/wp-content/uploads/2019/07/ob_5edc20_image.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN28gJLrePlHYWeP9aSTslwTTlOnpJ9KTpMKma7ixT5RREiD0mGSGadkPjgIki21cKN90&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvbZrirwQcFDV45OaTF0MTjTLFsxn_421axT-ZUKw8_zMmPdBaPLHCQP8NmlX12GVM1mg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQovGDs7UZUtkahssBzA35u3F1aWqlmViA-MGMrr7popo4kF1zrva8cfpD-MNIA5ZEndfY&usqp=CAU",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/BD_Weighing_of_the_Heart.jpg/933px-BD_Weighing_of_the_Heart.jpg",
  "https://cdn.shopify.com/s/files/1/0355/8493/4026/files/Sekhmet.jpg?v=1585753736",
  "https://cdn.thecollector.com/wp-content/uploads/2022/05/egyptian-goddess-sekhmet-sculptures.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf6DUMgg8Nq9ZyGT9hqXwFlhy6PE6rAn1lQsEzBOfx8rtdbTeWKh2pkXR7-v9rTWN1-os&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlJS7_2YFd3xDt3lrV0o7H7xzOTVey6mSXFg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV8EWF-N4kbEzTEvNlHgeDb1UL1pVeR4WAE23Ru1K28AL0eVX3l6I-JCEIb86Qg3hlXRM&usqp=CAU",
  "https://i.pinimg.com/736x/a7/90/6a/a7906ac62442642d9350f2f7be81e3d5.jpg",
  "https://i.pinimg.com/originals/af/f8/78/aff878cc627086da565b79fefe744669.jpg",
  "https://render.fineartamerica.com/images/images-profile-flow/400/images/artworkimages/mediumlarge/3/god-imgur-michael-jan-pitura.jpg",
  "https://lh3.googleusercontent.com/lL7Mll5CmGOS9wgDUymx49jGI3PVjX7DhheQDhJpDvjfPXdXSzYicjcRytGB4LEHV0oe1ILJUeVhzKjXBfwmTCsgXJIh-6OpxsftHJc=w600",
  "https://i.pinimg.com/originals/6d/56/d7/6d56d7a9d4bd012990b4d0c66d46bce2.jpg",
  "https://i.scdn.co/image/ab67616d0000b273b31471f27bc06dcf1c74baae",
  'https://cdn.shopify.com/s/files/1/0355/8493/4026/articles/Thot_Ancienne_Egypte_v2_1200x1200.jpg?v=1594132088',
  "https://ih1.redbubble.net/image.3078798507.3899/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg",
  "https://i.pinimg.com/474x/55/bd/fc/55bdfcb4fdf281d1930cc57bee60dff2--egyptian-mythology-egyptian-goddess.jpg",
  "https://i.pinimg.com/originals/de/89/90/de899029a1dd18ccccc0afa92e3189fa.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRpesyQopXThxKU4OxI_J-AwXKMOJ0ARQJw&usqp=CAU",
  'https://static.wikia.nocookie.net/smite_gamepedia/images/5/51/T_Thoth_CC_Card.png/revision/latest?cb=20161104204448',
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvLT81iS5r2eH-Ph9HtgCSIiqcuPe1HKYKRA&usqp=CAU"
];

List<String> words = [
  "Medu",
  "Neter",
  "Diop",
  "Cheik",
  "Sekhmet",
  "Maat",
  "kemet",
  "pharaon",
  "Sekhmet",
  "amon",
  "ra",
  "sekhmet",
  "Thot",
  "Anubis",
  "Maat",
  "Mere",
  "Africa",
  "Afrographix",
  "smart",
  "power",
  "Sekhmet",
  "maat",
  "ra",
  "amon",
  "fo",
  "africa",
  "egypt",
  "gods",
  "maat",
  "toukankhamon",
  "merer",
  "Sphynx",
  "ghizee",
  "kemet",
  "africa",
  "napata",
  "Osiris",
  "maat"
];

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
