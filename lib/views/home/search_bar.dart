import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xffECEDEC), borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(left: 15, right: 4),
                  child: Icon(
                    Icons.search,
                    color: Color(0xffC6C7C7),
                  ))),
          Expanded(
            child: TextFormField(
              controller: _controller,
              autocorrect: true,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.go,
              cursorColor: Color(0xffC6C7C7),
              decoration: InputDecoration(
                hintText: "Search notes",
                hintStyle: TextStyle(color: Color(0xffC6C7C7)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
