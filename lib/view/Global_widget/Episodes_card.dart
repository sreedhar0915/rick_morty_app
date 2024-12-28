import 'package:flutter/material.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';

class EpisodesCard extends StatelessWidget {
  final String episodeurl;
  final String Episodename;
  final String Date;
  final String episode;
  const EpisodesCard({
    required this.episodeurl,
    required this.Episodename,
    required this.Date,
    required this.episode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          Container(
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
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.Maincolor),
                          borderRadius: BorderRadius.circular(15),
                          color: ColorConstants.black,
                          image: DecorationImage(
                              image: AssetImage(episodeurl),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 60,
                      left: 60,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorConstants.black,
                              width: 1.0,
                            )),
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConstants.transperent,
                            child:
                                Center(child: Icon(Icons.play_arrow_rounded))),
                      ),
                    )
                  ]),
                  SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$Episodename",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                          SizedBox(height: 10),
                          Text("$episode",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                          SizedBox(height: 10),
                          Text("$Date",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: ColorConstants.star),
                              SizedBox(width: 2),
                              Icon(Icons.star, color: ColorConstants.star),
                              SizedBox(width: 2),
                              Icon(Icons.star, color: ColorConstants.star),
                              SizedBox(width: 2),
                              Icon(Icons.star, color: ColorConstants.star),
                              SizedBox(width: 2),
                              Icon(Icons.star, color: ColorConstants.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: CircleAvatar(
              backgroundColor: ColorConstants.black,
              child: IconButton(
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
                  )),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 10,
            child: CircleAvatar(
              backgroundColor: ColorConstants.black,
              child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Episodes Is Saved',
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
