import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;
import 'package:materi_http/future.dart';
import 'package:materi_http/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String body;

  @override
  void initState() {
    body = "belum ada data";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Request"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(body),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  var myResponse = await myhttp
                      .get(Uri.parse("https://reqres.in/api/users/3"));
                  Map<String, dynamic> data =
                      json.decode(myResponse.body) as Map<String, dynamic>;
                  if (myResponse.statusCode == 200) {
                    setState(() {
                      body = data["data"]["id"].toString();
                    });
                  } else {
                    setState(() {
                      body = "Error";
                    });
                  }
                },
                child: Text("Get Data")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostData()));
                },
                child: Text("Post Data")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MateriFuture()));
                },
                child: Text("Future Builder")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Menu mode",
                    hintText: "country in menu mode",
                  ),
                ),
                onChanged: print,
                selectedItem: "Brazil",
              ),
            )
          ],
        ),
      ),
    );
  }
}
