import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';
import 'package:rick_morty_app/view/Global_widget/Episodes_card.dart';
import 'package:rick_morty_app/view/Global_widget/appbar.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  late String callingEpisodes;

  @override
  void initState() {
    super.initState();
    callingEpisodes = """
query {
      episodes {
        info {
          count
          pages
          next
          prev
        }
        results {
          id
          name
          air_date
          episode
          created
          characters {
            id
            name
          }
        }
      }
    }
""";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: ColorConstants.black,
              child: Image(
                  image: AssetImage("assets/images/rick&morty.jpg"),
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Episodes",
                      style: TextStyle(
                          color: ColorConstants.Maincolor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text("View All",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            SizedBox(height: 10),
            Query(
                options: QueryOptions(document: gql(callingEpisodes)),
                builder: (result, {fetchMore, refetch}) {
                  if (result.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (result.hasException) {
                    return Center(
                        child: Text("Error: ${result.exception.toString()}"));
                  }

                  // Safely access the data and check if it's null or empty
                  var episodes = result.data?['episodes']?['results'];

                  if (episodes == null || episodes.isEmpty) {
                    return const Center(child: Text("No episodes found"));
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: List.generate(
                          episodes.length,
                          (index) => EpisodesCard(
                                episodeurl: "assets/images/r&mepisode.jpg",
                                Episodename: episodes[index]["name"],
                                Date: episodes[index]["air_date"],
                                episode: episodes[index]["episode"],
                              )),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
