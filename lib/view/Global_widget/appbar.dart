import 'package:flutter/material.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.black,
      surfaceTintColor: ColorConstants.black,
      leading: Container(
        color: ColorConstants.black,
        child: Image(
            image: AssetImage("assets/images/rick&mortydp.png"),
            fit: BoxFit.cover),
      ),
      title: Center(
        child: Text("RICK & MORTY",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: ColorConstants.Maincolor)),
      ),
      actions: [
        Icon(Icons.more_vert, color: ColorConstants.Maincolor),
        SizedBox(width: 10)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
