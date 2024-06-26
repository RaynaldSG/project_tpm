import 'package:flutter/material.dart';
import 'package:project_tpm/screens/Home/Main/component/BottomCard.dart';
import 'package:project_tpm/screens/Home/Main/component/TopCard.dart';

List<String> userLocation = <String>['Indonesia', 'Singapore', 'Japan', 'All'];
String locationNow = userLocation.first;

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        child: const Column(
          children: [TopCard(), BottomCard()],
        ),
      ),
    ));
  }
}
