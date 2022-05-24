import 'package:drink_app/model/drink_model.dart';
import 'package:drink_app/pages/item_details.dart';
import 'package:drink_app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:substring_highlight/substring_highlight.dart';

class ItemContainer extends StatelessWidget {
  final DrinkModel itemData;
  final String searchKey;
  const ItemContainer({Key? key, required this.itemData, this.searchKey = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        height: 140.0,
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: "item${itemData.drinkId}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: itemData.drinkThumbImage!,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        //Text(itemData.drinkName!, style: itemNameTextStyle),
                        SubstringHighlight(
                          text: itemData.drinkName!,
                          term: searchKey,
                          textStyle: itemNameTextStyle,
                          textStyleHighlight: itemNameHighlightTextStyle,
                        ),
                        Text(itemData.categoryName!,
                            style: categoryNameTextStyle),
                      ],
                    ),
                    Text(itemData.instructions!,
                        maxLines: 3, style: itemInstructionsTextStyle),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetails(itemData: itemData)));
      },
    );
  }
}
