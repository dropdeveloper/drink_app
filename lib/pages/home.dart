import 'package:drink_app/provider/item_provider.dart';
import 'package:drink_app/service/internet_service.dart';
import 'package:drink_app/widgets/item_container.dart';
import 'package:drink_app/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchKey = "";
  @override
  void initState() {
    super.initState();
    //load initial fetch from api
    Provider.of<ItemProvider>(context, listen: false).loadItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBox(onChanged: (text) {
              searchKey = text;
              setState(() {});
              Provider.of<ItemProvider>(context, listen: false)
                  .loadItem(key: text);
            }),
            Expanded(
              child: Consumer<ItemProvider>(builder: (context, data, _) {
                if (data.response == InternetResponse.LOADING) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.response == InternetResponse.ERROR) {
                  return const Center(
                    child: Text("Something went wrong!"),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.itemData.length,
                    itemBuilder: ((context, index) {
                      if (data.itemData.isNotEmpty) {
                        return ItemContainer(
                            itemData: data.itemData[index],
                            searchKey: searchKey);
                      } else {
                        return const Center(child: Text("Data not found !"));
                      }
                    }),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
