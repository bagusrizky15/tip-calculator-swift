import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:materi_http/models/user.dart';

class MateriFuture extends StatefulWidget {
  const MateriFuture({super.key});

  @override
  State<MateriFuture> createState() => _MateriFutureState();
}

class _MateriFutureState extends State<MateriFuture> {

  List<UserModel> allUser = [];

  Future getAllUser() async {
    // await Future.delayed(Duration(seconds: 3));
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(
          UserModel.fromJson(element)
        );
;      });
    } catch(e) {
      print("Error \(e)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: getAllUser(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: Text("Loading"));
          }
          return ListView.builder(
            itemCount: allUser.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("${allUser[index].avatar}"),
              ),
              title: Text("${allUser[index].firstName}"),
              subtitle: Text("${allUser[index].email}"),
            )
          );
        }
      ),
    );
  }
}