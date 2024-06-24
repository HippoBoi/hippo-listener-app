import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 201, 98, 132),
        leading: const Icon(Icons.menu_outlined),
        title: Row(
          children: [
            const Text(
              "Hippo Listener",
              style: TextStyle(
                  color: Color.fromARGB(255, 34, 3, 29),
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/hippoIcon.png",
              height: 40,
              width: 40,
            )
          ], // children
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
