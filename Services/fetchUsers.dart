import 'package:tttt/model/users.dart';
import "package:http/http.dart" as http ;
class fetchUsers{
  Future<List<Users>?> getUsers() async{
    var client = http.Client();
    var uri = Uri.parse("https://api.github.com/users");
    var result = await client.get(uri);
    if(result.statusCode == 200){
      var json  = result.body ;
      return UserFromJson(json);
    }
  }
}