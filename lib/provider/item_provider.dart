import 'package:drink_app/model/drink_model.dart';
import 'package:drink_app/service/internet_service.dart';
import 'package:drink_app/service/repository_helper.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  List<DrinkModel> itemData = [];
  InternetResponse response = InternetResponse.LOADING;

  void loadItem({String key = ""}) async {
    response = InternetResponse.LOADING;
    //clear exist data
    clearList();
    itemData = await RepositoryHelper().getDrinks(key);
    response = InternetResponse.DONE;
    notifyListeners();
  }

  void clearList() {
    if (itemData.isNotEmpty) {
      itemData.clear();
      notifyListeners();
    }
  }
}
