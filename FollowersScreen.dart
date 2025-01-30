import 'package:flutter/material.dart';
import 'package:tttt/model/users.dart';
class FollowersScreen extends StatefulWidget {
  List<Users>? followers = [];
  FollowersScreen({super.key, required this.followers});

  @override
  State<FollowersScreen> createState() => _FollowersscreenState();
}

class _FollowersscreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Followers"),backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,centerTitle: true,),
        body:  ListView.builder(
            itemCount: widget.followers!.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.followers![index].avatar_url),
                  radius: 40,
                ),
                title: Text(widget.followers![index].login),
                subtitle: Text(widget.followers![index].type),


              );
            })
      );
  }
}
