import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/payment_stuff/payment_screen.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/booking/booking2.dart';

class Booking1 extends StatefulWidget {
  final Rating rating;
  const Booking1({super.key, required this.rating});

  @override
  State<Booking1> createState() => _Booking1State();
}

class _Booking1State extends State<Booking1> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  //variables to store start and end date
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final TextEditingController _textFieldinController = TextEditingController();
  final TextEditingController _textFieldoutController = TextEditingController();
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;

      _checkinTextField();
      _checkoutTextField();
    });
  }

  void _checkinTextField() {
    if (_rangeStart != null) {
      _textFieldinController.text = '${_rangeStart!.toString()} ';
    } else {
      _textFieldinController.clear();
    }
  }

  void _checkoutTextField() {
    if (_rangeEnd != null) {
      _textFieldoutController.text = '${_rangeEnd!.toString()} ';
    } else {
      _textFieldoutController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2010, 3, 14),
          lastDay: DateTime.utc(2030, 3, 14),
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: _onDaySelected,
          rangeStartDay: _rangeStart,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onRangeSelected: _onRangeSelected,
          rangeEndDay: _rangeEnd,
          calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(color: AppColors.green1)),
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: ((focusedDay) {
            _focusedDay = focusedDay;
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              Text(
                'Check in',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                    controller: _textFieldinController,
                    readOnly: true,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(vertical: 15.0),
                        hintText: 'LastName',
                        hintStyle: TextStyle(color: AppColors.hinttext),
                        filled: true,
                        fillColor: AppColors.inputinactive)),
              ),
            ]),
            const Icon(Icons.forward),
            Column(
              children: [
                Text(
                  'Check out',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                      controller: _textFieldoutController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(vertical: 15.0),
                        hintText: 'LastName',
                        hintStyle: TextStyle(color: AppColors.hinttext),
                      )),
                ),
              ],
            ),
          ]),
        ),
        SizedBox(
          height: 50,
          width: 130,
          child: CartStepperInt(
            value: _counter,
            style: CartStepperStyle(
              activeBackgroundColor: AppColors.green1,
            ),
            didChangeCount: (count) {
              setState(() {
                _counter = count;
              });
            },
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
              height: 40,
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: AppColors.green1,
                onPressed: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => Booking2(
                  //           rating: widget.rating,
                  //         ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()));
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        )
      ],
    ));
  }
}
