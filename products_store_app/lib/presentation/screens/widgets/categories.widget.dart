import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final String text;
  const CategoriesWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 45,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                children: [
                  // Image.asset(
                  //   "assets/electronics.jpeg",
                  //   width: 30,
                  //   height: 30,
                  // ),
                  Text(
                    text,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
