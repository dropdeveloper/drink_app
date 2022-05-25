import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_app/model/drink_model.dart';
import 'package:drink_app/styles/text_style.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final DrinkModel itemData;
  const ItemDetails({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Hero(
            tag: "item${itemData.idDrink}",
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              child: CachedNetworkImage(
                imageUrl: itemData.strDrinkThumb!,
                width: size.width,
                height: size.height * 0.42,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  width: 32.0,
                  child: CircularProgressIndicator(strokeWidth: 1),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: size.height / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemData.strDrink!, style: itemDetailNameTextStyle),
                Text(itemData.strCategory!, style: categoryNameTextStyle),
                const SizedBox(height: 10.0),
                Text("Overview", style: overviewTextStyle),
                const SizedBox(height: 5.0),
                Flexible(
                  child: Text(itemData.strInstructions!,
                      style: itemDetailInstructionsTextStyle),
                ),
                const SizedBox(height: 5.0),
                Text("Ingredient", style: overviewTextStyle),
                const SizedBox(height: 5.0),
                Column(children: [
                  itemData.strIngredient1 != null
                      ? Row(
                          children: [
                            Expanded(
                              child: Text(itemData.strIngredient1),
                            ),
                            Expanded(
                              child: Text(itemData.strMeasure1 ?? ''),
                            ),
                          ],
                        )
                      : Container(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(itemData.strIngredient2 ?? ''),
                      ),
                      Expanded(
                        child: Text(itemData.strMeasure2 ?? ''),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(itemData.strIngredient3 ?? ''),
                      ),
                      Expanded(
                        child: Text(itemData.strMeasure3 ?? ''),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(itemData.strIngredient4 ?? ''),
                      ),
                      Expanded(
                        child: Text(itemData.strMeasure4 ?? ''),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(itemData.strIngredient5 ?? ''),
                      ),
                      Expanded(
                        child: Text(itemData.strMeasure5 ?? ''),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
