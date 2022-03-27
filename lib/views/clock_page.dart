// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, use_key_in_widget_constructors

import 'dart:async';

import '/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock_view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DigitalClockWidget(),
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w300,
                      color: CustomColors.primaryTextColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryTextColor,
                      fontSize: 24),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: CustomColors.primaryTextColor,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: CustomColors.primaryTextColor,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var perviousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute)
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedTime,
      style: TextStyle(
          fontFamily: 'avenir',
          color: CustomColors.primaryTextColor,
          fontSize: 64),
    );
  }
}
