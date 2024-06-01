import 'package:flutter/material.dart';
import 'package:project_tpm/screens/Booking/component/BookingForm.dart';

// Not Used
// Not Used
// Not Used

class DateTimePicker extends StatefulWidget {
  final String type;
  final Function() refreshParent;
  const DateTimePicker({super.key, required this.type, required this.refreshParent});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late DateTime selectedDate;

  @override
  void initState(){
    selectedDate = widget.type == 'From' ? selectedDateFrom : selectedDateTo;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.type == 'From' ? selectedDate : selectedDateTo = selectedDateFrom.add(const Duration(days: 1)),
        firstDate: widget.type == 'From' ? DateTime.now().toUtc() : selectedDateFrom.add(const Duration(days: 1)),
        lastDate: widget.type == 'From' ? DateTime.now().toUtc().add(const Duration(days: 365)) : selectedDateFrom.add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        if(widget.type == 'From'){
          selectedDateFrom = selectedDate;
          if(selectedDateTo.isBefore(selectedDate.add(const Duration(days: 1)))){
            selectedDateTo = selectedDate.add(const Duration(days: 1));
          }
          else{
            selectedDateTo = selectedDate;
          }
        }
        // widget.type == 'From' ?  selectedDateFrom = selectedDate : selectedDateTo = selectedDate;
      });
      widget.refreshParent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _informationText("${widget.type} Date", selectedDate.toString().substring(0, 10)),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _informationText(String info1, String info2) {
    TextStyle infoStyle = const TextStyle(fontSize: 18, color: Colors.black);

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: RichText(
        text: TextSpan(text: '$info1\t:', style: infoStyle, children: [
          TextSpan(
            text: info2,
          )
        ]),
      ),
    );
  }
}
