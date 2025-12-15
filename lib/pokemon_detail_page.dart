import 'package:flutter/material.dart';
import 'package:pertemuan_10/model/pokemon.dart';
import 'package:pertemuan_10/shared/widget/pokemon_card_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  backButton(),
                  headerText(pokemon),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 20),

              pokemonCard(pokemon),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerText(Pokemon pokemon) {
    return Column(
      children: [
        Text(
          pokemon.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(50, 60, 78, 1),
          ),
        ),
        Text(pokemon.type),
      ],
    );
  }

  Widget backButton() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, size: 30),
    );
  }

  Widget pokemonCard(Pokemon pokemon) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: PokemonCardWidget(
        imageUrl: pokemon.imageUrl, 
        type: pokemon.type,
        showType: false,
      ),
    );
  }
}
