// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors, unused_element, prefer_const_constructors,prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, dead_code, curly_braces_in_flow_control_structures, deprecated_member_use
import 'package:clock_alarm/constants/theme_data.dart';
import 'package:clock_alarm/data.dart';
import 'package:clock_alarm/enums.dart';
import 'package:clock_alarm/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'alarm_page.dart';
import 'clock_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, value, child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage();
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorial\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, child) {
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            color: currentMenuInfo.menuType == value.menuType
                ? CustomColors.menuBackgroundColor
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource ?? '',
                  scale: 1.5,
                ),
                SizedBox(height: 16),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 14),
                ),
              ],
            ));
      },
    );
  }
}
