import 'package:flutter/material.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current Location', style: TextStyle(
                color: ColorPallete.fifthColor,
              ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text('Yogyakarta'),
                ],
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        ],
      ),
    );
  }
}
