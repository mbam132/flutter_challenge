import 'package:flutter/material.dart';

class EpisodeWidget extends StatelessWidget {
  final Map<String, dynamic> episode;

  const EpisodeWidget({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFE9E8E4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episode['name'] ?? 'Unknown',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Air Date: ${episode['air_date'] ?? 'Unknown'}',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'Created: ${episode['created'] ?? 'Unknown'}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
