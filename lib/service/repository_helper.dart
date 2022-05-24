import 'package:drink_app/model/drink_model.dart';
import 'package:drink_app/service/internet_service.dart';

class RepositoryHelper {
  Future<List<DrinkModel>> getDrinks(String searchKey) async {
    //await internetService.initialized;
    List<DrinkModel> result = [];
    Map<String, dynamic> response =
        await internetService.getData(searchKey: searchKey);
    if (response['drinks'] != null) {
      response['drinks'].forEach((v) {
        result.add(DrinkModel.fromJson(v));
      });
    }

    return result;
  }
}
