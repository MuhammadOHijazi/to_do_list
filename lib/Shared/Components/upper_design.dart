import 'package:flutter/material.dart';

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

Widget upperDesign(){
  return Stack(
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
            const SizedBox(height: 20),
            Text(
              "${monthList[DateTime.now().month]} ${DateTime.now().day}, ${DateTime.now().year}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
            ),
            Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff4A3780),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}