import 'package:drink_app/styles/color.dart';
import 'package:drink_app/styles/text_style.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function(String)? onChanged;
  const SearchBox({Key? key, this.onChanged}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          fillColor: searchBoxBgColor,
          filled: true,
          border: InputBorder.none,
          hintText: "Search drinks",
          hintStyle: hintTextStyle,
          prefixIcon: const Icon(Icons.search_outlined),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  icon: const Icon(Icons.close_outlined))
              : null,
        ),
        onChanged: (s) {
          widget.onChanged!(s);
          setState(() {});
        },
      ),
    );
  }
}
