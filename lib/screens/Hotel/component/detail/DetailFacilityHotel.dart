import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tpm/controller/HotelController.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

class DetailFacilityHotel extends StatefulWidget {
  final List<String> facilitiesArr;
  const DetailFacilityHotel({super.key, required this.facilitiesArr});

  @override
  State<DetailFacilityHotel> createState() => _DetailFacilityHotelState();
}

class _DetailFacilityHotelState extends State<DetailFacilityHotel> {
  HotelController hotelController = HotelController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
              child: const Text("Facilities", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              )
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: _facilitiesItemBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _facilitiesItemBuilder(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: widget.facilitiesArr.length,
        itemBuilder: (context, index) => _itemFacility(widget.facilitiesArr[index]),
    );
  }

  Widget _itemFacility(String iconInfo){
    return Container(
      margin: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(hotelController.getFacilitiesIcon(iconInfo)),
            Container(
              padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorPallete.secondaryColor
                ),
                child: Text(iconInfo)),
          ],
        ),
    );
  }
}
