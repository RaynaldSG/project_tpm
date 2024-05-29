import 'package:flutter/material.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';
import 'package:readmore/readmore.dart';

class DetailInfoHotel extends StatelessWidget {
  const DetailInfoHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_topInfo(), _bottomInfo()],
    );
  }

  Widget _topInfo() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama HotelLLLLLLLLLLLLLLLLLLLLLLL',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Lokasi Hotel'),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 30,
                ),
                Text(
                  '5.0',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomInfo() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: const Column(
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5,),
          ReadMoreText(
            'Boasting a fitness centre, Yogyakarta Marriott Hotel is set in Yogyakarta and is 3.5 km from Tugu Monument. 5 km from Malioboro Street, the property is also 5 km away from Malioboro Mall. The property is close to popular attractions like Fort Vredeburg, Scientific Park and Sultan\'s Palace, all reachable within 6 km.\n\nAll guest rooms in the hotel are equipped with a flat-screen TV. With a private bathroom fitted with a shower and free toiletries, certain rooms at Yogyakarta Marriott Hotel also provide guests with pool view. Guest rooms will provide guests with a desk and a kettle.\n\nYogyakarta Presidential Palace is 6 km from the accommodation. The nearest airport is Adisucipto Airport, 5 km from the property.',
            trimMode: TrimMode.Line,
            trimLines: 3,
            colorClickableText: ColorPallete.primaryColor,
            trimCollapsedText: 'Read More...',
            trimExpandedText: ' Read Less',
          ),
        ],
      ),
    );
  }
}
