class UserModel {
  String avatar;
  String displayName;
  String id;
  String fullName;
  String email;
  String userRole;

  UserModel(
      {this.avatar,
      this.displayName,
      this.id,
      this.fullName,
      this.email,
      this.userRole});

  UserModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    displayName = json['displayName'];
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    userRole = json['userRole'];
  }
}
