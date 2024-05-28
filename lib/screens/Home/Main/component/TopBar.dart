import 'package:flutter/material.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';


List<String> userLocation = <String>['Indonesia', 'Singapore', 'Japan', 'All'];
class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String locationNow = userLocation.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Current Location', style: TextStyle(
                color: ColorPallete.fifthColor,
              ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  _dropdownWidget(),
                ],
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        ],
      ),
    );
  }

  Widget _dropdownWidget(){
    return DropdownButton<String>(
      value: locationNow,
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        setState(() {
          locationNow = value!;
        });
      },
      items: userLocation.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
