import 'package:flutter/material.dart';
import 'package:splach_app/features/apis/model/model.dart';

class TeamDetailsScreen extends StatelessWidget {
  final Team team;

  const TeamDetailsScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(team.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Badge
            Image.network(team.badge, width: 120),
            const SizedBox(height: 16),

            Text(
              team.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Text(team.country, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 16),

            /// Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _infoRow("Stadium", team.stadium),
                  const SizedBox(height: 8),
                  _infoRow("Short Name", team.shortName),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Description
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              team.description.isEmpty
                  ? "No description available."
                  : team.description,
              style: const TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
