import 'package:flutter/material.dart';

class MyToDoList extends StatelessWidget {
  const MyToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff4A3780),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xff4A3780),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 75),
                        Text(
                          "${DateTime.now().day} -${DateTime.now().month} - ${DateTime.now().year}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "My Todo List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
