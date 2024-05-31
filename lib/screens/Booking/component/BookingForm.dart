import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_tpm/controller/BookingController.dart';
import 'package:project_tpm/controller/HistoryController.dart';
import 'package:project_tpm/controller/TimeController.dart';
import 'package:project_tpm/model/HotelDetailModel.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';

import '../../../model/HistoryModel.dart';

late List<String> roomType;
DateTime selectedDateFrom = DateTime.now().toUtc();
TimeOfDay hotelTimeNow = TimeOfDay.fromDateTime(DateTime.now().toUtc());
TimeOfDay userTimeNow = TimeOfDay.fromDateTime(DateTime.now().toUtc());
DateTime selectedDateTo = DateTime.now().toUtc().add(const Duration(days: 1));
TimeOfDay selectedTime = TimeOfDay.fromDateTime(DateTime.now().toUtc())
    .replacing(hour: hotelTimeNow.hour + 1);
BookingController bookingController = BookingController();
TimeController timeControllerBooking = TimeController();
HistoryController historyController = HistoryController();

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
  late DateTime hotelDate;
  late DateTime userDate;

  late String roomNow;
  int _selectedRoomIndex = 0;
  late Timer timer;

  @override
  void initState() {
    hotelDate = DateTime.now().toUtc().add(Duration(
        hours: timeControllerBooking.timeConvertHour(timeControllerBooking
            .convertCountryToCode(widget.hotelData.location!))));
    userDate = DateTime.now().toUtc().add(Duration(
        hours: timeControllerBooking.timeConvertHour(widget.timeLocationNow)));

    print(hotelDate);

    selectedDateFrom = hotelDate;
    selectedDateTo = hotelDate.add(const Duration(days: 1));

    roomType = <String>[...widget.hotelData.roomsInfo!.roomType!];
    roomNow = roomType.first;

    hotelTimeNow = TimeOfDay.fromDateTime(hotelDate);
    userTimeNow = TimeOfDay.fromDateTime(userDate);

    selectedTime = TimeOfDay.fromDateTime(DateTime.now().toUtc()).replacing(
        hour: (hotelTimeNow.hour +
                1 +
                timeControllerBooking.timeConvertHour(widget.timeLocationNow)) %
            24);
    _startUpdateMin();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
            'Your Local Time: '
            '${TimeOfDay.fromDateTime(DateTime.now().toUtc()).replacing(hour: (TimeOfDay.fromDateTime(DateTime.now().toUtc()).hour + timeControllerBooking.timeConvertHour(widget.timeLocationNow)) % 24).format(context)}',
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          child: Text(
            'Hotel Local Time: '
            '${TimeOfDay.fromDateTime(DateTime.now().toUtc()).replacing(hour: (TimeOfDay.fromDateTime(DateTime.now().toUtc()).hour + timeControllerBooking.timeConvertHour(timeControllerBooking.convertCountryToCode(widget.hotelData.location!))) % 24).format(context)}',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _informationText('Time',
                ' ${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}'),
            _timePickerContainer(),
            // TimePicker(
            //   timeNowTimePicker: hotelTimeNow.replacing(
            //       hour: TimeOfDay.fromDateTime(DateTime.now().toUtc()).hour +
            //           timeControllerBooking
            //               .timeConvertHour(widget.timeLocationNow)),
            // ),
          ],
        ),
        _dateBuilder('To', selectedDateTo),
        _informationText('Total',
            '${widget.currencyNow} ${bookingController.calculateTotal(selectedDateFrom, selectedDateTo, widget.hotelData.roomsInfo!.roomPrice![_selectedRoomIndex], widget.currencyNow).toString()}'),
        _submitButton(),
      ],
    );
  }

  void _startUpdateMin() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        hotelDate = DateTime.now().toUtc().add(Duration(
            hours: timeControllerBooking.timeConvertHour(timeControllerBooking
                .convertCountryToCode(widget.hotelData.location!))));
        hotelTimeNow = TimeOfDay.fromDateTime(hotelDate);

        // selectedTime = hotelTimeNow.replacing(
        //           hour: (hotelTimeNow.hour +
        //               1) % 24);
        // if(bookingController.checkTime(selectedDateFrom, selectedDateTo, userTimeNow, hotelTimeNow)){
        //   print('tes1');
        //   selectedTime = hotelTimeNow.replacing(
        //       hour: (hotelTimeNow.hour +
        //           1) % 24);
        //   counter++;
        //   if(counter == 2){
        //     selectedDateTo = selectedDateFrom.add(Duration(days: 1));
        //     counter = 0;
        //   }
        // }
        print(hotelTimeNow);
      });
    });
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
          ? hotelDate
          : selectedDateFrom.add(const Duration(days: 1)),
      lastDate: type == 'From'
          ? DateTime.now().toUtc().add(const Duration(days: 365))
          : selectedDateFrom.add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        if (type == 'From') {
          selectedDateFrom = selectedDate;
          if (selectedDateTo
              .isBefore(selectedDate.add(const Duration(days: 1)))) {
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

  // Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: hotelTimeNow,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        if (bookingController.checkTime(selectedDateFrom, selectedDateTo,
            picked, hotelTimeNow, hotelDate)) {
          print('tes1');
          print(hotelDate);
          print(selectedDateFrom);
          selectedTime = picked;
          return;
        }
        SnackBar snackBar = const SnackBar(content: Text("Invalid Time"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  Widget _timePickerContainer() {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () => _selectTime(context),
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorPallete.primaryColor,
            foregroundColor: ColorPallete.secondaryColor),
        child: const Text('Select Time'),
      ),
    );
  }

  // Button
  Widget _submitButton() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        child: ElevatedButton(
            onPressed: () {
              if (bookingController.checkTime(selectedDateFrom, selectedDateTo,
                  selectedTime, hotelTimeNow, hotelDate)) {
                String roomType =
                    widget.hotelData.roomsInfo!.roomType![_selectedRoomIndex];
                String roomPrice =
                    '${widget.currencyNow} ${bookingController.currencyConverter(widget.currencyNow, widget.hotelData.roomsInfo!.roomPrice![_selectedRoomIndex]).toString()}';
                String totalPrice =
                    '${widget.currencyNow} ${bookingController.calculateTotal(selectedDateFrom, selectedDateTo, widget.hotelData.roomsInfo!.roomPrice![_selectedRoomIndex], widget.currencyNow).toString()}';

                historyController.setHistory(HistoryModel(
                    hotelId: widget.hotelData.id!,
                    fromDate: DateFormat('dd-MM-yyy').format(selectedDateFrom),
                    toDate: DateFormat('dd-MM-yyy').format(selectedDateTo),
                    time: selectedTime.format(context),
                    roomType: roomType,
                    roomPrice: roomPrice,
                    totalPrice: totalPrice));
                SnackBar snackBar = const SnackBar(content: Text("Success"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              } else {
                SnackBar snackBar =
                    const SnackBar(content: Text("Fail, Invalid Input"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPallete.primaryColor,
              foregroundColor: ColorPallete.secondaryColor,
            ),
            child: const Text('Submit')),
      ),
    );
  }
}
