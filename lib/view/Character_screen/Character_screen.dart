import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';
import 'package:rick_morty_app/view/Global_widget/Character_card.dart';
import 'package:rick_morty_app/view/Global_widget/appbar.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late String callingCharacters;

  @override
  void initState() {
    super.initState();
    callingCharacters = """
query {
  characters {
    info {
      count
    }
    results {
      id
      name
      image
      status
      species
      type
      origin {
        id
      }
      gender
      image
      location {
        id
      }
      episode {
        id
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Character",
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
              options: QueryOptions(document: gql(callingCharacters)),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (result.hasException) {
                  return Center(
                      child: Text("Error: ${result.exception.toString()}"));
                }

                // Safely access the data and check if it's null or empty
                var characters = result.data?['characters']?['results'];

                if (characters == null || characters.isEmpty) {
                  return const Center(child: Text("No characters found"));
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: List.generate(
                        characters.length,
                        (index) => CharacterCard(
                              imageurl: characters[index]['image'],
                              name: characters[index]['name'],
                              species: characters[index]['species'],
                              gender: characters[index]['gender'],
                              status: characters[index]['status'],
                            )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
