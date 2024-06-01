// import 'package:flutter/material.dart';
// import 'package:project_tpm/controller/BookingController.dart';
// import 'package:project_tpm/screens/Booking/component/BookingForm.dart';
// import 'package:project_tpm/utils/color/colorPalette.dart';
//
// class TimePicker extends StatefulWidget {
//   final TimeOfDay timeNowTimePicker;
//   const TimePicker({super.key, required this.timeNowTimePicker});
//
//   @override
//   State<TimePicker> createState() => _TimePickerState();
// }
//
// class _TimePickerState extends State<TimePicker> {
//   BookingController bookingController = BookingController();
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         if(bookingController.checkTime(picked, selectedDateFrom, widget.timeNowTimePicker)){
//           selectedTime = picked;
//           return;
//         }
//         SnackBar snackBar = const SnackBar(content: Text("Invalid Time"));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(right: 10),
//       child: ElevatedButton(
//         onPressed: () => _selectTime(context),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: ColorPallete.primaryColor,
//           foregroundColor: ColorPallete.secondaryColor
//         ),
//         child: const Text('Select Time'),
//       ),
//     );
//   }
//
//   Widget _informationText(String info1, String info2) {
//     TextStyle infoStyle = const TextStyle(
//         fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
//
//     return Container(
//       margin: const EdgeInsets.only(top: 10, left: 20),
//       child: RichText(
//         text: TextSpan(text: '$info1\t: ', style: infoStyle, children: [
//           TextSpan(
//             text: info2,
//             style: const TextStyle(fontWeight: FontWeight.normal),
//           ),
//         ]),
//       ),
//     );
//   }
// }
