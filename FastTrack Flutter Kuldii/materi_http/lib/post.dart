import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  final name = TextEditingController();
  final job = TextEditingController();

  String hasilResponse = "belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextField(
            controller: name,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name"
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: job,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job"
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {
            var myresponse = await http.post(
              Uri.parse("https://reqres.in/api/users"),
              body: {
                "name": name.text, "job": job.text
              }

            );
            Map<String, dynamic> data = json.decode(myresponse.body) as Map<String, dynamic>;
            
            setState(() {
              hasilResponse = data["job"];
            });

            print(myresponse.body);
          }, child: Text("Post Data")),
          SizedBox(height: 20,),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 20,),
          Text(hasilResponse)
        ],
      )
    );
  }
}