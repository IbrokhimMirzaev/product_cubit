import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My View"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            4,
            (index) {
              Color randomColor = Color.fromRGBO(
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
                1,
              );
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 2 / 3,
                color: randomColor,
              );
            },
          ),
        ),
      ),
    );
  }
}

// ListView(
// children: List.generate(4, (index) {
// Color randomColor = Color.fromRGBO(
// random.nextInt(255),
// random.nextInt(255),
// random.nextInt(255),
// 1,
// );
// return Container(
// width: double.infinity,
// height: MediaQuery.of(context).size.height * 2 / 3,
// color: randomColor,
// );
// }),
// ),
