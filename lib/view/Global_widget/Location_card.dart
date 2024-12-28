import 'package:flutter/material.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';

class LocationCard extends StatelessWidget {
  final String locationurl;
  final String? place;
  final String? type;
  const LocationCard({
    super.key,
    required this.locationurl,
    required this.place,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstants.Maincolor,
              border: Border.all(color: ColorConstants.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorConstants.black,
                        border: Border.all(color: ColorConstants.Maincolor),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(locationurl), fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(place ?? "Unknown Location",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Text(type ?? "Unknown Dimension",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: ColorConstants.black,
              child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Location Is Saved',
                            style: TextStyle(color: ColorConstants.black)),
                        backgroundColor: ColorConstants.Maincolor,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.bookmark_border,
                    color: ColorConstants.Maincolor,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
