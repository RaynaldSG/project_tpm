import 'package:flutter/material.dart';
import 'package:project_tpm/model/HotelDetailModel.dart';
import 'package:project_tpm/screens/Booking/component/BookingForm.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

List<String> currencyList = ['IDR', 'USD', 'SGD', 'JPY'];
List<String> timeList = ['WIB', 'WITA', 'WIT', 'LDN', 'SGT', 'JST'];

class BookingScreen extends StatefulWidget {
  final HotelDetailData hotelData;
  const BookingScreen({super.key, required this.hotelData});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String currencyNow = currencyList.first;
  String timeSelectionNow = timeList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking', style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: ColorPallete.secondaryColor,
        centerTitle: true,
        actions: [
          _dropdownTimeWidget(),
          _dropdownWidget()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookingForm(hotelData: widget.hotelData, currencyNow: currencyNow, timeLocationNow: timeSelectionNow,),
          ],
        ),
      ),
    );
  }

  Widget _dropdownWidget() {
    return DropdownButton<String>(
      value: currencyNow,
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        setState(() {
          currencyNow = value!;
        });
      },
      items: currencyList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _dropdownTimeWidget() {
    return DropdownButton<String>(
      value: timeSelectionNow,
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        setState(() {
          timeSelectionNow = value!;
        });
      },
      items: timeList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(
            width: 35,
              child: Text(value, style: const TextStyle(
                fontSize: 14
              ),)),
        );
      }).toList(),
    );
  }

}
