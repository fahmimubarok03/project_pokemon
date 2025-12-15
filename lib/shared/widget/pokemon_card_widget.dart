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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: _getTypeColor(type),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(type),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Grass':
        return const Color.fromRGBO(196, 228, 213, 1);
      case 'Fire':
        return const Color.fromRGBO(239, 221, 186, 1);
      case 'Water':
        return const Color.fromRGBO(190, 219, 221, 1);
      default:
        return Colors.grey.shade300;
    }
  }
}
