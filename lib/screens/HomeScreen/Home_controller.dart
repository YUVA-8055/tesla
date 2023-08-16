import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isHoodLock = true;
  bool isbonnetLock = true;
  int selectedBotmNavTab = 0;
  bool isCoolSelected = true;
  bool isShowTyre = false;

  void onBotmNavTabChange(int index) {
    selectedBotmNavTab = index;
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateHoodLock() {
    isHoodLock = !isHoodLock;
    notifyListeners();
  }

  void updateBonnetLock() {
    isbonnetLock = !isbonnetLock;
    notifyListeners();
  }

  void updateCoolSelectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  void showTyreController(int index) {
    if (index == 3) {
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyre = true;
        notifyListeners();
      });
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }
}
