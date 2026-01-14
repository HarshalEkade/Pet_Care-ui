import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomersTab extends StatelessWidget {
  const CustomersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, i) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/Profile.png"),
                ),
                title: const Text(
                  "Carlitta Pusso",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text("Lara | Sheltie\nFemale"),
                trailing: _petChip(i),
                isThreeLine: true,
              );
            },
          ),
        ),
      ],
    );
  }

  

  Widget _petChip(int index) {
    final pets = ["Guinea Pig", "Dog", "Hamster", "Cat"];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        pets[index],
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
