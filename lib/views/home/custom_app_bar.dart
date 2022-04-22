import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0.0,
      leading: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Icon(
          Icons.menu,
          color: kPrimaryColor,
        ),
      ),
      title: Text(
        "Notes",
        style: TextStyle(color: kPrimaryColor, fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.dns_outlined,
            //Icons.grid_view,

            color: kSecondColor,
          ),
        ),
        SizedBox(
          width: 3,
        ),
      ],
    );
  }
}
