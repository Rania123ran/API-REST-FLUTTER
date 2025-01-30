import 'dart:convert';

List<Users> UserFromJson(String str)=>
    List<Users>.from(json.decode(str).map((e)=>Users.fromJson(e)));
class Users {
  String avatar_url , type , login ;
  Users({required this.login , required this.type , required this.avatar_url});
  factory Users.fromJson(Map <String , dynamic> json){
    return Users(login: json["login"],
                type: json["type"],
                 avatar_url: json["avatar_url"]);
  }
}