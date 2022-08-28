class User {
  int idUser;
  String avatar;
  String coverImage;
  String fullName;
  bool isOnline;

  User({
    required this.coverImage,
    required this.avatar,
    required this.idUser,
    required this.fullName,
    required this.isOnline,
  });

  static User fromJSON(dynamic user) {
    return User(
      idUser: user["idUser"],
      fullName: user["fullName"],
      isOnline: user["isOnline"],
      avatar: user["avatar"],
      coverImage: user["coverImage"],
    );
  }

  static List<User> fromJSONArray(dynamic users) {
    List<User> usersObj = [];
    users.forEach((userItem) {
      usersObj.add(User.fromJSON(userItem));
    });
    return usersObj;
  }

  static String AnkhAPIMockerInit = """{
    int idUser;
    String avatar;
    String coverImage;
    String fullName;
    bool isOnline;
  }""";
}
