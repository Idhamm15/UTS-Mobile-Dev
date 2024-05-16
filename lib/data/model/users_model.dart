class UserModel {
  int? id;
  String? fullName;
  String? email;
  String? password;

  UserModel(
      {
        this.id, 
        this.fullName, 
        this.email, 
        this.password, 
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullname'];
    email = json['email'];
    password = json['password'];
  }
}
