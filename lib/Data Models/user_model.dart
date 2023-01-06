class UserModel {
  String avatar;
  String displayName;
  String id;
  String fullName;
  String email;
  bool admin;
  List<dynamic> ratings;

  UserModel(
      {this.avatar,
      this.displayName,
      this.id,
      this.fullName,
      this.email,
      this.admin,
      this.ratings});

  UserModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    displayName = json['displayName'];
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    admin = json['userRole'];
    ratings =
        json['ratings'] == null ? null : List<dynamic>.from(json['ratings']);
  }
}
