import 'package:flutter/material.dart';
import 'package:materi_http/homepage.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Lottie.asset("assets/lottie/eskrim.json"),
            TextField(
              decoration: InputDecoration(
                  label: Text("Email"), border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text("Password"), border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
