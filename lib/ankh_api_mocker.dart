library ankh_api_mocker;

import 'dart:math' as math;

/// A Calculator.
class AnkhAPIMocker {
  int randomIntGenerator(int max) {
    var random = math.Random();
    return random.nextInt(max);
  }

  double randomDoubleGenerator() {
    var random = math.Random();
    return double.parse((random.nextDouble() * 100).toStringAsFixed(2));
  }

  bool randomBoolGenerator() {
    var date = DateTime.now().millisecondsSinceEpoch;
    return date % 2 == 0;
  }

  String randomStringGenerator() {
    if (randomBoolGenerator()) return "Sekhmet";
    List<String> chars = ["Ankh", "Maat", "Amon", "Afro"];
    String suffix = "";
    suffix += chars[randomIntGenerator(chars.length - 1)];
    return "Sekhmet-" + suffix;
  }
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
    String name;
    String email;
  }""";
}
