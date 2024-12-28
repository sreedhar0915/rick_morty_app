import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_morty_app/Utilis/Constants/Color_constants.dart';
import 'package:rick_morty_app/view/Global_widget/Location_card.dart';
import 'package:rick_morty_app/view/Global_widget/appbar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String callingLocations;

  @override
  void initState() {
    super.initState();
    callingLocations = """
  query {
  characters {
    info {
      count
      pages
      next
      prev
    }
    results {
     location {
       id
      name
      type
      dimension
    created
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                style: TextStyle(color: ColorConstants.Maincolor),
                decoration: InputDecoration(
                  hintText: "Search Location",
                  labelText: "Search Location",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: ColorConstants.Maincolor, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Location",
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
                options: QueryOptions(document: gql(callingLocations)),
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
                    return const Center(
                        child: Text(
                      "No location found",
                      style: TextStyle(color: ColorConstants.Maincolor),
                    ));
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: List.generate(characters.length, (index) {
                        var location = characters[index]['location'];

                        return LocationCard(
                          locationurl: "assets/images/rick&morty.jpg",
                          place: location["name"],
                          type: location["type"],
                        );
                      }),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
