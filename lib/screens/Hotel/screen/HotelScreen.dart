import 'package:flutter/material.dart';
import 'package:project_tpm/controller/HotelController.dart';
import 'package:project_tpm/model/HotelsModel.dart';
import 'package:project_tpm/screens/Hotel/component/HotelCard.dart';
import 'package:project_tpm/utils/api_request/ApiRequest.dart';

import '../../../utils/color/colorPalette.dart';

class HotelScreen extends StatefulWidget {
  final String location;
  final bool sort;

  const HotelScreen({super.key, required this.location, required this.sort});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late HotelsModel hotelsData;
  HotelController hotelController = HotelController();
  final TextEditingController _searchController = TextEditingController();

  void _searchControl(String searchText){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hotels",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorPallete.secondaryColor,
      ),
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
          List<Hotel> hotelsDataRev = hotelController
              .getHotelsData(hotelsData, widget.location, _searchController.text, sort: widget.sort);
          return _buildSuccessSection(hotelsDataRev);
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

  Widget _buildSuccessSection(List<Hotel> hotelsData) {
    return Column(
      children: [
        _searchBar(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 8 / 7, mainAxisSpacing: 10),
              padding: const EdgeInsets.all(0),
              itemCount: hotelsData.length,
              itemBuilder: (BuildContext context, int index) {
                return HotelCard(hotelData: hotelsData[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: ColorPallete.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: ColorPallete.thirdColor),
          ),
        ),
        onChanged: _searchControl,
      ),
    );
  }
}
