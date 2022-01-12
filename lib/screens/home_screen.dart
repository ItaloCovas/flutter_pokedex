import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/pokemon_details_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List pokedex = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      // It checks if the widget HomeScreen is already mounted, then do the request.
      getPokemonData();
    }
  }

  void getPokemonData() async {
    var apiUrl = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(apiUrl);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        pokedex = decodedData['pokemon'];
        setState(() {});
      }
    } catch (e) {
      print('***Erro***: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset('assets/images/pokeball.png',
                  width: 200, fit: BoxFit.fitWidth),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Text("Pokedex",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.6),
                  )),
            ),
            Positioned(
              top: 150,
              bottom: 0,
              width: width,
              child: Column(
                children: [
                  // ignore: unnecessary_null_comparison
                  pokedex != null
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                            ),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: pokedex.length,
                            itemBuilder: (context, index) {
                              var type = pokedex[index]['type'][0];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: InkWell(
                                  child: SafeArea(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: type == "Grass"
                                            ? Colors.greenAccent
                                            : type == "Fire"
                                                ? Colors.redAccent
                                                : type == "Water"
                                                    ? Colors.blue
                                                    : type == "Electric"
                                                        ? Colors.yellow
                                                        : type == "Rock"
                                                            ? Colors.grey
                                                            : type == "Ground"
                                                                ? Colors.brown
                                                                : type ==
                                                                        "Psychic"
                                                                    ? Colors
                                                                        .indigo
                                                                    : type ==
                                                                            "Fighting"
                                                                        ? Colors
                                                                            .orange
                                                                        : type ==
                                                                                "Bug"
                                                                            ? Colors.lightGreenAccent
                                                                            : type == "Ghost"
                                                                                ? Colors.deepPurple
                                                                                : type == "Normal"
                                                                                    ? Colors.grey
                                                                                    : type == "Poison"
                                                                                        ? Colors.deepPurpleAccent
                                                                                        : Colors.pink,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            bottom: -10,
                                            right: -10,
                                            child: Image.asset(
                                                'assets/images/pokeball.png',
                                                height: 100,
                                                fit: BoxFit.fitHeight),
                                          ),
                                          Positioned(
                                            top: 20,
                                            left: 10,
                                            child: Text(
                                              pokedex[index]['name'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 45,
                                            left: 20,
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 4,
                                                    bottom: 4),
                                                child: Text(
                                                  type.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.black26,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Hero(
                                              tag: index,
                                              child: CachedNetworkImage(
                                                imageUrl: pokedex[index]['img'],
                                                height: 100,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder:
                                                (_) => PokemonDetailsScreen(
                                                      pokemonDetail:
                                                          pokedex[index],
                                                      color: type == "Grass"
                                                          ? Colors.greenAccent
                                                          : type == "Fire"
                                                              ? Colors.redAccent
                                                              : type == "Water"
                                                                  ? Colors.blue
                                                                  : type ==
                                                                          "Electric"
                                                                      ? Colors
                                                                          .yellow
                                                                      : type ==
                                                                              "Rock"
                                                                          ? Colors
                                                                              .grey
                                                                          : type == "Ground"
                                                                              ? Colors.brown
                                                                              : type == "Psychic"
                                                                                  ? Colors.indigo
                                                                                  : type == "Fighting"
                                                                                      ? Colors.orange
                                                                                      : type == "Bug"
                                                                                          ? Colors.lightGreenAccent
                                                                                          : type == "Ghost"
                                                                                              ? Colors.deepPurple
                                                                                              : type == "Normal"
                                                                                                  ? Colors.grey
                                                                                                  : type == "Poison"
                                                                                                      ? Colors.deepPurpleAccent
                                                                                                      : Colors.pink,
                                                      heroTag: index,
                                                    )));
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
