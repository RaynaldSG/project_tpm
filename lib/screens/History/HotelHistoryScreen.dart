import 'package:flutter/material.dart';
import 'package:project_tpm/controller/HistoryController.dart';
import 'package:project_tpm/model/HistoryModel.dart';
import 'package:project_tpm/model/HotelsModel.dart';
import 'package:project_tpm/screens/History/component/HotelCardHistory.dart';
import 'package:project_tpm/utils/api_request/ApiRequest.dart';

import '../../../utils/color/colorPalette.dart';

class HotelHistoryScreen extends StatefulWidget {

  const HotelHistoryScreen({super.key});

  @override
  State<HotelHistoryScreen> createState() => _HotelHistoryScreenState();
}

class _HotelHistoryScreenState extends State<HotelHistoryScreen> {
  late HotelsModel hotelsData;
  HistoryController historyController = HistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Histori",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorPallete.secondaryColor,
      body: _getHotelsData(),
    );
  }

  Widget _getHotelsData() {
    return FutureBuilder(
      future: ApiRequest.instance.loadHotels(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          HotelsModel hotelsData = HotelsModel.fromJson(snapshot.data);
          List<HistoryModel> historyData = historyController.getHistory();
          List<Hotel> hotelsDataRev = [];

          for(var history in historyData){
            Hotel hotel;
            hotel = hotelsData.data!.firstWhere((element) => history.hotelId == element.id!);
            hotelsDataRev.add(hotel);
          }

          return _buildSuccessSection(hotelsDataRev, historyData);
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

  Widget _buildSuccessSection(List<Hotel> hotelsData, List<HistoryModel> historyData) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 8 / 9, mainAxisSpacing: 10),
        padding: const EdgeInsets.all(0),
        itemCount: hotelsData.length,
        itemBuilder: (BuildContext context, int index) {
          return HotelCardHistory(hotelData: hotelsData[index], historyData: historyData[index], historyId: index + 1);
        },
      ),
    );
  }
}
