import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/modules/home/HomeController.dart';

class HomeScreen extends GetView<Homecontroller> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}