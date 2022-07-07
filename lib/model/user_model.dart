class User{
  String? username;
  String? password;
  User({this.username,this.password});
  User.fromJson(Map<String, dynamic> json)
  : username = json['username'],
    password = json['password'];

  Map<String,dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}
class Account {
  String? email;
  String? number;
  String? adress;
  Account({this.email,this.adress,this.number});
  Account.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        number = json['number'],
        adress = json['adress'];

  Map<String,dynamic> toJson() => {
    'email': email,
    'number': number,
    'adress': adress,
  };
}