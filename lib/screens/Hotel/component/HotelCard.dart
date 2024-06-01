import 'package:flutter/material.dart';
import 'package:project_tpm/controller/BookmarkController.dart';
import 'package:project_tpm/screens/Hotel/screen/DetailHotelScreen.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

import '../../../model/HotelsModel.dart';

class HotelCard extends StatefulWidget {
  final Hotel hotelData;
  const HotelCard({super.key, required this.hotelData});

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  BookmarkController bookmarkController = BookmarkController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailHotelScreen(id: widget.hotelData.id!)));
      },
      child: Card(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                        image: NetworkImage(widget.hotelData.imageUrl!),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Text(
                    widget.hotelData.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.hotelData.location!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorPallete.fifthColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.hotelData.country!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorPallete.fifthColor,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bookmarkController.setBookmark(widget.hotelData.id!);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: ColorPallete.thirdColor,
                  child: Icon(
                    Icons.bookmark,
                    color: bookmarkController.checkBookmark(widget.hotelData.id!) ? ColorPallete.primaryColor : ColorPallete.secondaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 30,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    child: Text(
                      widget.hotelData.reviewScore!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: ColorPallete.thirdColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
