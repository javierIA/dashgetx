import 'package:get/state_manager.dart';

import "package:dashgetx/app/models/temp_model.dart";

class TempController extends GetxController {
  Rx<TempModel> tempModel = Rx<TempModel>(TempModel());
  @override
  void onInit() {
    tempModel.value = TempModel();
    tempModel.value.temp = "19";
    tempModel.value.date = "19/12/2021";
    tempModel.value.time = "12:00";
    tempModel.value.hold = false;
    tempModel.value.id = 1;
    tempModel.value.mode = "Auto";
    super.onInit();
  }

  void updateTemp(String temp) {
    if (temp == "+") {
      int change = int.parse(tempModel.value.temp.toString());
      change++;
      tempModel.value.temp = change.toString();
      update();
    } else if (temp == "-") {
      int change = int.parse(tempModel.value.temp.toString());
      change--;
      tempModel.value.temp = change.toString();
      update();
    }
  }

  void updateMode() {
    switch (tempModel.value.mode) {
      case "Mode":
        tempModel.value.mode = "Auto";
        break;
      case "Auto":
        tempModel.value.mode = "Manual";
        break;
      case "Manual":
        tempModel.value.mode = "Auto";
        break;
      default:
        tempModel.value.mode = "Mode";
        break;
    }
    update();
  }
}
