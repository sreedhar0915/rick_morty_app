import 'package:flutter/material.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';

class CharacterCard extends StatelessWidget {
  final String imageurl;
  final String name;
  final String species;
  final String status;
  final String gender;
  const CharacterCard({
    required this.imageurl,
    required this.species,
    required this.status,
    required this.gender,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.black),
              borderRadius: BorderRadius.circular(15),
              color: ColorConstants.Maincolor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Stack(children: [
                  Container(
                    height: 190,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.Maincolor),
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConstants.black,
                        image: DecorationImage(
                            image: NetworkImage("$imageurl"),
                            fit: BoxFit.cover)),
                  ),
                  IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to favorite',
                                style: TextStyle(color: ColorConstants.black)),
                            backgroundColor: ColorConstants.Maincolor,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: ColorConstants.Red,
                      ))
                ]),
                SizedBox(width: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("$species",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                        SizedBox(height: 10),
                        Text("$gender",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(height: 10),
                        Text("$status",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
