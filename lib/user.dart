class User {
  int idUser;
  String fullName;
  bool isOnline;

  User({
    required this.fullName,
    required this.idUser,
    required this.isOnline,
  });

  static User fromJSON(dynamic user) {
    return User(
      idUser: user["idUser"],
      isOnline: user["isOnline"],
      fullName: user["avatar"],
    );
  }

  static List<User> fromJSONArray(dynamic users) {
    List<User> usersObj = [];
    users.forEach((userItem) {
      usersObj.add(User.fromJSON(userItem));
    });
    return usersObj;
  }

  static String AnkhMockerInit = """{
    int idUser;
    String avatar;
    bool isOnline;
  }""";
}
