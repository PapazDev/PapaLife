import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:papalife/model/metting.dart';

class MyCalenderPage extends StatefulWidget {
  MyCalenderPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<MyCalenderPage> {
  DeviceCalendarPlugin _deviceCalendarPlugin = new DeviceCalendarPlugin();

  final _meetings = <Meeting>[];

  void retrieveCalendars() async {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    //Retrieve user's calendars from mobile device
    //Request permissions first if they haven't been granted
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }

      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      setState(() {
        var list = _deviceCalendarPlugin.retrieveEvents(
            calendarsResult?.data[0].id,
            RetrieveEventsParams(
                startDate: DateTime.parse('2019-12-11'),
                endDate: DateTime.now()));
        list.then((value) {
          value.data.forEach((f) {
            _meetings.add(Meeting(
                f.title, f.start, f.end, const Color(0xFF0F8644), f.allDay));
          });
          //print(_meetings.length);
          _meetings.add(Meeting('Conference', startTime, endTime,
              const Color(0xFF0F8644), false));
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      dataSource: MeetingDataSource(_getDataSource()),
      monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: true),
    ));
  }

  List<Meeting> _getDataSource() {
    var meetings = _meetings;
    _meetings.clear();
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    _meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    retrieveCalendars();
    return meetings;
  }
}
