import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({ Key? key, required this.pokemonDetail, required this.color, required this.heroTag }) : super(key: key);

  final pokemonDetail;
  final Color color;
  final int heroTag;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
              ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(widget.pokemonDetail['name'], style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Text(widget.pokemonDetail['type'].join(', '), style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black26,
              ),
            ),
          ),
          Positioned(
            top: height * 0.18,
            right: -10,
            child: Image.asset('assets/images/pokeball.png', height: 200, fit: BoxFit.fitHeight),
            ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.3,
                            child: Text("Name:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                          SizedBox(
                            child: Text(widget.pokemonDetail['name'], style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.3,
                            child: Text("Height:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                          SizedBox(
                            child: Text(widget.pokemonDetail['height'], style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.3,
                            child: Text("Weight:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                          SizedBox(
                            child: Text(widget.pokemonDetail['weight'], style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.3,
                            child: Text("Spawn time:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                          SizedBox(
                            child: Text(widget.pokemonDetail['spawn_time'], style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.32,
                            child: Text("Weaknesses:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                          SizedBox(
                            child: Text(widget.pokemonDetail['weaknesses'].join(', '), style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.30,
                            child: Text("Previous evolution:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                            widget.pokemonDetail['prev_evolution'] != null ?
                            SizedBox(
                              height: 20,
                              width: width * 0.50,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(widget.pokemonDetail['prev_evolution'][index]['name'], style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  );
                                },
                                itemCount: widget.pokemonDetail['prev_evolution'].length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ) : Center(child:
                            Text("Already on min evolution", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                            ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: width * 0.30,
                            child: Text("Evolution:", style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))
                            ),
                            widget.pokemonDetail['next_evolution'] != null ?
                            SizedBox(
                              height: 20,
                              width: width * 0.50,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(widget.pokemonDetail['next_evolution'][index]['name'], style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  );
                                },
                                itemCount: widget.pokemonDetail['next_evolution'].length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ) : Center(child:
                            Text("Already on max evolution", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                            ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.18),
            left: (width/2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}