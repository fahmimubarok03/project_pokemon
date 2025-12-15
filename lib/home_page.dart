import 'package:flutter/material.dart';
import 'package:pertemuan_10/model/dummy_data.dart';
import 'package:pertemuan_10/pokemon_detail_page.dart';
import 'package:pertemuan_10/shared/widget/pokemon_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchName = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(24.0), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText(),
            SizedBox(height: 20),
            searchBar(searchName),
            SizedBox(height: 20),
            listPokemon(),
          ],
        )),
      ),
    );
  }

  Widget headerText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              'Pokedex',
              style: TextStyle(
                fontSize:35,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Search for a pokemon by name or using its National Pokedex number.',
              style: TextStyle(
                fontSize:20,
              ),
            ),
      ],
    );
  }

  Widget searchBar(TextEditingController searchName){
    return Row(
      spacing: 10,
      children: [
        Expanded(child: TextFormField(
          controller: searchName,
          decoration: InputDecoration(
            hintText: "Search a Pokemon", 
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            prefixIcon: Icon(Icons.search),
            
          ),
        )),
        Container(
          padding: EdgeInsets.all(8.0),
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(93, 95, 124, 1),
          ),
          child: Icon(Icons.filter_list, color: Colors.white),
        ),
      ],
    );
  }

  Widget listPokemon (){
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12
        ), 
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = dummyPokemonList[index];
          return PokemonCardWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(pokemon: pokemon))
              );
            },
            imageUrl: pokemon.imageUrl,
            name: pokemon.name,
            type: pokemon.type,
          );
        },),
    );
  }
}