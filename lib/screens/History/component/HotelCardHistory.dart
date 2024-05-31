import 'package:flutter/material.dart';
import 'package:project_tpm/controller/BookmarkController.dart';
import 'package:project_tpm/model/HistoryModel.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

import '../../../model/HotelsModel.dart';

class HotelCardHistory extends StatefulWidget {
  final Hotel hotelData;
  final HistoryModel historyData;
  final int historyId;
  const HotelCardHistory({super.key, required this.hotelData, required this.historyData, required this.historyId});

  @override
  State<HotelCardHistory> createState() => _HotelCardHistoryState();
}

class _HotelCardHistoryState extends State<HotelCardHistory> {
  BookmarkController bookmarkController = BookmarkController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Text('ID: ${widget.historyId}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          _infoContainer('Hotel: ', widget.hotelData.name!),
          _infoContainer('From Date: ', widget.historyData.fromDate),
          _infoContainer('To Date: ', widget.historyData.toDate),
          _infoContainer('Time: ', widget.historyData.time),
          _infoContainer('Room Type: ', widget.historyData.roomType),
          _infoContainer('Room Price: ', widget.historyData.roomPrice),
          _infoContainer('Total Price: ', widget.historyData.totalPrice),
        ],
      ),
    );
  }

  Widget _infoContainer(String text, String info){
    return Container(
      child: RichText(
        text: TextSpan(
          text:  text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: info,
              style: const TextStyle(
                fontSize: 18,
                color: ColorPallete.fifthColor,
              ),
            )
          ]
        ),
      ),
    );
  }
}
