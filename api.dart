import 'package:flutter/material.dart';
import 'package:tttt/Services/fetchFollowers.dart';
import 'package:tttt/Services/fetchUsers.dart';
import 'FollowersScreen.dart';
import 'model/users.dart';
main(){
  runApp(MyHome());
}
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Users>? users = [] ;
  List<Users>? followers = [];
  @override
  void initState() {
   getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API REST",
      home: Scaffold(
        appBar: AppBar(
          title: Text("API REST"),
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: FutureBuilder(future: fetchUsers().getUsers(),
            builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Text("Error : ${snapshot.error}");
          }
          else if(snapshot.hasData){
            return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(users![index].avatar_url),
                      radius: 40,
                    ),
                    title: Text(users![index].login),
                    subtitle: Text(users![index].type),
                    trailing: PopupMenuButton(
                        itemBuilder: (context)=>[
                          PopupMenuItem(value: 0,child: Text("Followers"),),
                        ],
                    onSelected: (i){
                          switch(i){
                            case 0 : {getFollowers(users![index].login);
                              Navigator.push(context, MaterialPageRoute(builder: (e)=>FollowersScreen(followers : followers)));}
                          }
                    },),

                  );
                });
          }
          else{
            return Text("Data not found !");
          }

        })
      ),);

  }
  getUsers() async {
    users = await fetchUsers().getUsers() ;
  }
  getFollowers(String login) async {
    followers = await fetchFollowers().getFollowers(login);
  }
}
