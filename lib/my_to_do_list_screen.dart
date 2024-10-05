import 'package:flutter/material.dart';

class MyToDoList extends StatelessWidget {
  const MyToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    List monthList = [
      "Month",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff4A3780),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 50,
                        blurRadius: 70,
                        offset: Offset(1, 3), // changes position of shadow
                      ),
                    ],
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
                              "${monthList[DateTime.now().month]} ${DateTime.now().day}, ${DateTime.now().year}",
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
                Positioned(
                  left: -100,
                  bottom: -90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white10,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4A3780),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -50,
                  top: -15,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white10,
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4A3780),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.all(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDBECF6),
                      ),
                      child: Icon(
                        Icons.article_outlined,
                        color: Color(0xff194A66),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Task Name",
                   style: TextStyle(
                     fontSize: 18,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
