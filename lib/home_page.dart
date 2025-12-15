import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pertemuan_10/model/dummy_data.dart';
import 'package:pertemuan_10/shared/widget/pokemon_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final searchName = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerText(),
              SizedBox(height: 20),
              SearchBar(searchName),
              SizedBox(height: 20),
              listPokemon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget SearchBar(TextEditingController searchName) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: TextFormField(
            controller: searchName,
            decoration: InputDecoration(
              hintText: 'Search Pokemon',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
          child: Icon(Icons.filter_list),
        ),
      ],
    );
  }

  Widget headerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pokedex',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Search for a Pokemon by name or using its National Pokedex number.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget listPokemon() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          return PokemonCardWidget(
            onTap: () {
              log(dummyPokemonList[index].name);
            },
            imageUrl: dummyPokemonList[index].imageUrl,
            name: dummyPokemonList[index].name,
            type: dummyPokemonList[index].type,
          );
        },
      ),
    );
  }
}

