import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_tpm/controller/BookingController.dart';
import 'package:project_tpm/controller/TimeController.dart';
import 'package:project_tpm/model/HotelDetailModel.dart';
import 'package:project_tpm/screens/Booking/component/TimePicker.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

late List<String> roomType;
DateTime selectedDateFrom = DateTime.now();
TimeOfDay timeNow = TimeOfDay.now();
DateTime selectedDateTo = DateTime.now().add(const Duration(days: 1));
TimeOfDay selectedTime = TimeOfDay.now().replacing(hour: timeNow.hour + 1);

class BookingForm extends StatefulWidget {
  final HotelDetailData hotelData;
  final String currencyNow;
  final String timeLocationNow;
  const BookingForm(
      {super.key,
      required this.hotelData,
      required this.currencyNow,
      required this.timeLocationNow});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  BookingController bookingController = BookingController();
  TimeController timeControllerBooking = TimeController();
  late String roomNow;
  int _selectedRoomIndex = 0;

  @override
  void initState() {
    roomType = <String>[...widget.hotelData.roomsInfo!.roomType!];
    roomNow = roomType.first;
    selectedDateFrom = timeControllerBooking.timeConvert(
        widget.timeLocationNow, selectedDateFrom);
    selectedDateFrom = timeControllerBooking.timeConvert(
        widget.timeLocationNow, selectedDateFrom);
    timeNow = TimeOfDay.now().replacing(
        hour: timeNow.hour +
            timeControllerBooking.timeConvertHour(widget.timeLocationNow));
    selectedTime = TimeOfDay.now().replacing(
        hour: timeNow.hour +
            1 +
            timeControllerBooking.timeConvertHour(widget.timeLocationNow));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          child: Text(
            'Hotel Local Time: ${timeNow.replacing(hour: (TimeOfDay.now().hour + timeControllerBooking.timeConvertHour(widget.timeLocationNow))).format(context)}',
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        _informationText('Hotel', widget.hotelData.title!),
        _roomDropdown(),
        _informationText('Room Price',
            '${widget.currencyNow} ${bookingController.currencyConverter(widget.currencyNow, widget.hotelData.roomsInfo!.roomPrice![_selectedRoomIndex]).toString()}'),
        _dateBuilder(
            'From',
            timeControllerBooking.timeConvert(
                widget.timeLocationNow, selectedDateFrom)),
        TimePicker(
          timeNowTimePicker: timeNow.replacing(
              hour: TimeOfDay.now().hour +
                  timeControllerBooking
                      .timeConvertHour(widget.timeLocationNow)),
        ),
        _dateBuilder('To', selectedDateTo),
        _informationText('Total',
            '${widget.currencyNow} ${bookingController.calculateTotal(selectedDateFrom, selectedDateTo, widget.hotelData.roomsInfo!.roomPrice![_selectedRoomIndex], widget.currencyNow).toString()}'),
      ],
    );
  }

  Widget _informationText(String info1, String info2) {
    TextStyle infoStyle = const TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: RichText(
        text: TextSpan(text: '$info1\t: ', style: infoStyle, children: [
          TextSpan(
            text: info2,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ]),
      ),
    );
  }

  Widget _roomDropdown() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: DropdownMenu<String>(
        initialSelection: roomType.first,
        width: 350,
        onSelected: (String? value) {
          setState(() {
            roomNow = value!;
            _selectedRoomIndex = widget.hotelData.roomsInfo!.roomType!
                .indexWhere((element) => element.contains(roomNow));
          });
        },
        dropdownMenuEntries:
            roomType.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry(
              value: value, label: value, labelWidget: _labelWidget(value));
        }).toList(),
      ),
    );
  }

  Widget _labelWidget(String value) {
    return SizedBox(
      width: 325,
      child: Text(value),
    );
  }

  // Date Picker
  Future<void> _selectDate(
      BuildContext context, DateTime selectedDate, String type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: type == 'From'
          ? selectedDate
          : selectedDateTo.isBefore(selectedDateFrom)
              ? selectedDateTo = selectedDateFrom.add(const Duration(days: 1))
              : selectedDate,
      firstDate: type == 'From'
          ? DateTime.now()
          : selectedDateFrom.add(const Duration(days: 1)),
      lastDate: type == 'From'
          ? DateTime.now().add(const Duration(days: 365))
          : selectedDateFrom.add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        if (type == 'From') {
          selectedDateFrom = selectedDate;
          if (selectedDateTo.isBefore(selectedDate.add(const Duration(days: 1)))) {
            selectedDateTo = selectedDate.add(const Duration(days: 1));
          }
        } else {
          selectedDateTo = selectedDate;
        }
        // widget.type == 'From' ?  selectedDateFrom = selectedDate : selectedDateTo = selectedDate;
      });
    }
  }

  Widget _dateBuilder(String type, DateTime selectedDate) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _informationText(
              "$type Date", selectedDate.toString().substring(0, 10)),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () => _selectDate(context, selectedDate, type),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.primaryColor,
                  foregroundColor: ColorPallete.secondaryColor),
              child: const Text('Select Date'),
            ),
          ),
        ],
      ),
    );
  }
}
