import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback action;

  const CategoriesWidget(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.action});

  getImage(String category) {
    switch (category) {
      case "electronics":
        return "assets/electonics.png";
      case "jewelery":
        return "assets/joyas.png";
      case "men's clothing":
        return "assets/ropa_hombre.png";
      case "women's clothing":
        return "assets/ropa_mujer.png";
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action.call(),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 20,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: const EdgeInsets.only(
            left: 30,
          ),
          child: Row(
            children: [
              Image.asset(
                getImage(text),
                width: 30,
                height: 30,
              ),
              Text(
                text,
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}