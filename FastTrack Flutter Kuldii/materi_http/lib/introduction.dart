import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:materi_http/homepage.dart';
import 'package:materi_http/login.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: const Center(
            child: Icon(Icons.waving_hand, size: 50.0),
          ),
        ),
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: const Center(
            child: Icon(Icons.waving_hand, size: 50.0),
          ),
        )
      ],
      showNextButton: true,
      done: const Text("Done"),
      next: const  Text("Lanjot"),
      onDone: () {
        // On button pressed
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }
}
