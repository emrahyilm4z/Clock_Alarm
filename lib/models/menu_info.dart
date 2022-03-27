// ignore_for_file: unnecessary_this

import 'package:clock_alarm/enums.dart';
import 'package:flutter/widgets.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? imageSource;
  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
