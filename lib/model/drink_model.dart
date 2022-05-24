class DrinkModel {
  String? drinkId;
  String? drinkName;
  String? categoryName;
  String? instructions;
  String? drinkThumbImage;
  List<IngredientModel>? ingredients = [];

  DrinkModel({
    this.drinkId,
    this.categoryName,
    this.drinkName,
    this.drinkThumbImage,
    this.instructions,
    this.ingredients,
  });

  DrinkModel.fromJson(Map<String, dynamic> json) {
    drinkId = json['idDrink'];
    categoryName = json['strCategory'];
    drinkName = json['strDrink'];
    drinkThumbImage = json['strDrinkThumb'];
    instructions = json['strInstructions'];

    for (num i = 0; i < 15; i++) {
      if (json['strIngredient${i + 1}'] != null) {
        ingredients!.add(IngredientModel(
            ingredient: json['strIngredient${i + 1}'],
            measure: json['strMeasure${i + 1}']));
      }
    }
  }
}

class IngredientModel {
  String? ingredient;
  dynamic measure;

  IngredientModel({this.ingredient, this.measure});
}
