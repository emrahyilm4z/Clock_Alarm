// ignore_for_file: unused_element, prefer_const_constructors, unused_import
import 'package:clock_alarm/constants/theme_data.dart';
import 'package:clock_alarm/enums.dart';
import 'models/alarm_info.dart';
import 'models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 1)),
      title: 'Office',
      gradientColorIndex: 0,
      id:1,
      isPending: true),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      title: 'Sport',
      gradientColorIndex: 1,
      id:2,
      isPending: true),
];