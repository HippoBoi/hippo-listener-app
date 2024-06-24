import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              height: 40,
              width: 20,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 201, 98, 132)),
              child: Row(
                children: [
                  const Icon(Icons.play_arrow),
                  const SizedBox(width: 30),
                  Text(
                    "canción: $index",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        // ignore: prefer_const_constructors
                        color: Color.fromARGB(255, 53, 6, 45),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
