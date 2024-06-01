import 'package:flutter/material.dart';
import 'package:project_tpm/model/HotelDetailModel.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';
import 'package:readmore/readmore.dart';

class DetailInfoHotel extends StatelessWidget {
  final HotelDetailData hotelDetailData;
  const DetailInfoHotel({super.key, required this.hotelDetailData});

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelDetailData.title!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(child: Text(hotelDetailData.location!)),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 30,
                ),
                Text(
                  hotelDetailData.rating!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
      child: Column(
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5,),
          ReadMoreText(
            hotelDetailData.description!,
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
