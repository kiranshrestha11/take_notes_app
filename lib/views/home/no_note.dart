import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class NoNote extends StatelessWidget {
  const NoNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 2,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            "assets/images/not_found.png",
            height: 200,
          ),
          Positioned(
            bottom: -10,
            child: Text(
              "No Notes Available",
              style: TextStyle(color: greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
