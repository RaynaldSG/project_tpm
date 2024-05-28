import 'package:flutter/material.dart';
import 'package:project_tpm/screens/Hotel/screen/HotelScreen.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

List<String> userLocation = <String>['Indonesia', 'Singapore', 'Japan', 'All'];

class TopCard extends StatefulWidget {
  const TopCard({super.key});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  String locationNow = userLocation.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [_topInfo(), _topCaraousel()],
      ),
    );
  }

  Widget _topInfo() {
    return Column(
      children: [
        _dropdownContainer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'High Rating Hotel',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(location: locationNow, sort: true)));
                },
                icon: const Icon(Icons.arrow_forward,),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _topCaraousel() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => _imageCard()),
    );
  }

  Widget _imageCard() {
    return Container(
      width: 250,
      height: 500,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    'https://cf.bstatic.com/xdata/images/hotel/square240/467524871.jpg?k=23f4ddf9e9e1bc2d6ce41cfb2b1451b39ad69b1d25ce9b76e5e913f8361103dd&o=',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hotel Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Yogya'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700], size: 30),
                          const SizedBox(width: 5),
                          const Text('5.0'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownContainer(){
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
