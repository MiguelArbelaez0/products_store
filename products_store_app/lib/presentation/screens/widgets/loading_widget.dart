import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Lottie.asset("assets/loading.json"),
    );
  }
}
