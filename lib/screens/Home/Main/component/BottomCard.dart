import 'package:flutter/material.dart';
import 'package:project_tpm/controller/HotelController.dart';
import 'package:project_tpm/screens/Hotel/screen/DetailHotelScreen.dart';

import '../../../../model/HotelsModel.dart';
import '../../../../utils/api_request/ApiRequest.dart';
import '../../../Hotel/screen/HotelScreen.dart';
import '../HomeMainScreen.dart';

class BottomCard extends StatefulWidget {
  const BottomCard({super.key});

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  HotelController hotelController = HotelController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [_topInfo(), _dataGetter()],
      ),
    );
  }

  Widget _topInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'All Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HotelScreen(
                            location: 'all',
                            sort: false,
                          )));
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
          )
        ],
      ),
    );
  }

  Widget _Caraousel(List<Hotel> hotelData) {
    return ListView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // This is to allow the SingleChildScrollView to handle scrolling
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => _imageCard(hotelData[index]),
    );
  }

  Widget _imageCard(Hotel hotelData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailHotelScreen(id: hotelData.id!)));
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.network(
                  hotelData.imageUrl!,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelData.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(hotelData.location!),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700], size: 20),
                          const SizedBox(width: 5),
                          Text(hotelData.reviewScore!),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataGetter() {
    return FutureBuilder(
      future: ApiRequest.instance.loadHotels(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          HotelsModel hotelsData = HotelsModel.fromJson(snapshot.data);
          List<Hotel> hotelsDataRev = hotelController
              .getHotelsData(hotelsData, locationNow, '', sort: false);
          return _Caraousel(hotelsDataRev);
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
}
