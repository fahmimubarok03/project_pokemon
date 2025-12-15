import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  final String imageUrl;
  final String? name;
  final String type;
  final VoidCallback? onTap;
  final bool showType;

  const PokemonCardWidget({
    Key? key,
    required this.imageUrl,
    this.name,
    required this.type,
    this.onTap,
    this.showType = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: type == "Grass"
              ? const Color.fromRGBO(196, 228, 213, 1)
              : type == "Fire"
              ? const Color.fromRGBO(239, 221, 186, 1)
              : const Color.fromRGBO(190, 219, 221, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(
              imageUrl, 
              fit: BoxFit.fill, 
              width: double.infinity
            ),

            if (name != null)
              Text(
                name!,
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                ),
              ),
              
            if (showType)
              Text(type),
          ],
        ),
      ),
    );
  }
}