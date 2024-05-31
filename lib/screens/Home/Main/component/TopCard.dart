import 'package:flutter/material.dart';
import 'package:project_tpm/controller/HotelController.dart';
import 'package:project_tpm/screens/Hotel/screen/DetailHotelScreen.dart';
import 'package:project_tpm/screens/Hotel/screen/HotelScreen.dart';
import 'package:project_tpm/utils/api_request/ApiRequest.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

import '../../../../model/HotelsModel.dart';
import '../../../../utils/notification/NotificationService.dart';
import '../HomeMainScreen.dart';

class TopCard extends StatefulWidget {
  const TopCard({super.key});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HotelScreen(location: locationNow, sort: true)));
                },
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _topCaraousel(List<Hotel> hotelData) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => _imageCard(hotelData[index])),
    );
  }

  Widget _imageCard(Hotel hotelData) {
    return Container(
      width: 310,
      height: 500,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailHotelScreen(id: hotelData.id!)));
            },
            child: Card(
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
                      hotelData.imageUrl!,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 5),
                    child: Text(
                      hotelData.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hotelData.location!),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: Colors.yellow[700], size: 30),
                            Text(hotelData.reviewScore!),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownContainer() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Current Location',
                style: TextStyle(
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
          IconButton(
              onPressed: () {
                NotificationService().showNotification(title: 'tes', body: 'tes');
              }, icon: const Icon(Icons.notifications_outlined)),
        ],
      ),
    );
  }

  Widget _dropdownWidget() {
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
              .getHotelsData(hotelsData, locationNow, '', sort: true);
          return _topCaraousel(hotelsDataRev);
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
