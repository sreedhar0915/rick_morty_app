import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_morty_app/view/Splash_screen/Splash_screen.dart';

void main() async {
  await initHiveForFlutter();

  // Wrap the GraphQLClient in a ValueNotifier
  final client = GraphQLClient(
    link: HttpLink('https://rickandmortyapi.com/graphql'),
    cache: GraphQLCache(store: HiveStore()),
  );

  // Pass the ValueNotifier of client
  final notifier = ValueNotifier(client);

  runApp(MyApp(client: notifier));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splashscreen(),
        ),
      ),
    );
  }
}
