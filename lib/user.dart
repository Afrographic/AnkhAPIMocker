class User {
  int idUser;
  String fullName;
  bool isOnline;

  User({
    required this.idUser,
    required this.fullName,
    required this.isOnline,
  });

  static User fromJSON(dynamic user) {
    return User(
      idUser: user["idUser"],
      fullName: user["fullName"],
      isOnline: user["isOnline"],
    );
  }

  static String AnkhAPIMockerInit = """{
  int idUser;
  String  fullName;
  bool isOnline;
}""";
}
