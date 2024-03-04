import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${c.count.value}", style: TextStyle(fontSize: 50),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  c.decrement();
                }, child: Text("-")),
                ElevatedButton(onPressed: (){
                  c.increment();
                }, child: Text("+"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;
}