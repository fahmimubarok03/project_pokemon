import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final VoidCallback? onTap;

  const PokemonCardWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.onTap,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: type == 'Fire' ? Colors.red[100] :
                 type == 'Water' ? Colors.blue[100] :
                 type == 'Grass' ? Colors.green[100] :
                 Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(imageUrl,
            fit: BoxFit.fill,
            width: double.infinity,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(type),
          ],
        ),
      ),
    );
  }
}