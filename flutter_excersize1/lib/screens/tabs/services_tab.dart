import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ServiceCard(
          title: "Day Care",
          subtitle: "Pet day care facility\nShort stays up to 12 hrs.",
          icon: "assets/Day Care.png",
          active: true,
        ),
        _ServiceCard(
          title: "Night Stay",
          subtitle: "Pet night stay facility\nLonger overnight stays",
          icon: "assets/Night Care.png",
          active: false,
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final bool active;

  const _ServiceCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(icon, height: 28),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGrey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: active ? AppColors.green : AppColors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              active ? "Active" : "Inactive",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
