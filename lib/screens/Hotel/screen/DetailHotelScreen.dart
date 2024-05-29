import 'package:flutter/material.dart';
import 'package:project_tpm/screens/Hotel/component/detail/DetailImageHotel.dart';
import 'package:project_tpm/screens/Hotel/component/detail/DetailInfoHotel.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({super.key});

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hotel Detail'),
          centerTitle: true,
          backgroundColor: ColorPallete.secondaryColor,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [DetailImageHotel(), DetailInfoHotel()],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPallete.primaryColor
            ),
            child: Container(
              child: const Text("Booking", style: TextStyle(
                color: ColorPallete.secondaryColor
              ),),
            ),
        )
    );
  }
}
