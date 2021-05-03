class UserModel{
  final String id;
  final String email;
  final String password;
  final String name;
  final String goal;

  UserModel(this.id, this.name, this.email, this.password, {this.goal = ""});

  UserModel.fromJson(Map<String, dynamic> json)
  :
    id = json['id'],
  email = json['email'],
  name = json['name'],
  password = json['password'],
  goal = json['goal'];

  Map<String,dynamic> toJson()=>{
    'id' : id,
    'email' : email,
    'password' : password,
    'name' : name,
    'goal' : goal
  };

}