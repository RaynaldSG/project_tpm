import 'package:flutter/material.dart';
import 'package:project_tpm/model/HotelDetailModel.dart';
import 'package:project_tpm/screens/Hotel/component/detail/DetailFacilityHotel.dart';
import 'package:project_tpm/screens/Hotel/component/detail/DetailImageHotel.dart';
import 'package:project_tpm/screens/Hotel/component/detail/DetailInfoHotel.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

import '../../../utils/api_request/ApiRequest.dart';

class DetailHotelScreen extends StatefulWidget {
  final int id;
  const DetailHotelScreen({super.key, required this.id});

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
      body: _getHotelsData(),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorPallete.primaryColor),
        child: Container(
          child: const Text(
            "Booking",
            style: TextStyle(color: ColorPallete.secondaryColor),
          ),
        ),
      ),
    );
  }

  Widget _getHotelsData() {
    return FutureBuilder(
      future: ApiRequest.instance.loadDetailHotel(widget.id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          HotelDetail hotelDataAll = HotelDetail.fromJson(snapshot.data);
          HotelDetailData hotelData = hotelDataAll.data!;
          return _buildSuccessSection(hotelData);
        }
        return _buildLoadingSection();
      },
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(HotelDetailData hotelData) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailImageHotel(
            hotelDetailData: hotelData,
          ),
          DetailInfoHotel(
            hotelDetailData: hotelData,
          ),
          DetailFacilityHotel(
            facilitiesArr: hotelData.mostPopularFacilities!,
          )
        ],
      ),
    );
  }
}
