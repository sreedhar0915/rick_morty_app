import 'package:flutter/material.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';
import 'package:rick_morty_app/view/Character_screen/Character_screen.dart';
import 'package:rick_morty_app/view/Episodes_screen/Episodes_screen.dart';
import 'package:rick_morty_app/view/Location_screen/Location_screen.dart';

class BottomnavibarScreen extends StatefulWidget {
  const BottomnavibarScreen({super.key});

  @override
  State<BottomnavibarScreen> createState() => _BottomnavibarScreenState();
}

class _BottomnavibarScreenState extends State<BottomnavibarScreen> {
  int selecttab = 0;

  final List<Widget> screens = [
    CharacterScreen(),
    LocationScreen(),
    EpisodesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selecttab],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: ColorConstants.black,
      onTap: (value) {
        setState(() {
          selecttab = value;
        });
      },
      selectedItemColor: ColorConstants.Maincolor,
      unselectedItemColor: ColorConstants.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.emoji_people_rounded),
          icon: Icon(Icons.emoji_people_outlined),
          label: "Character",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.location_on_sharp),
          icon: Icon(Icons.location_on_outlined),
          label: "Location",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.photo_rounded),
          icon: Icon(Icons.photo_outlined),
          label: "Episodes",
        ),
      ],
    );
  }
}
