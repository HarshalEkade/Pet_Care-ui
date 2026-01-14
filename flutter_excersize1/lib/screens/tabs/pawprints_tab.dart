import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class PawprintsTab extends StatelessWidget {
  const PawprintsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        
     
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Pet Sitting Performance",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _statsGrid(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text("Overall Ratings",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
        _ratingCard(),
        const SizedBox(height: 20),
        Text("Recent Reviews",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
        _reviewCard(),
      ],
    );
  }

 

  Widget _statsGrid() {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    childAspectRatio: 1.1,
    children: const [
      _StatCard(
        title: "Views",
        value: "999,000",
        color: Colors.blue,
        imagePath: "assets/View.png",
      ),
      _StatCard(
        title: "Likes",
        value: "999,000",
        color: Colors.red,
        imagePath: "assets/Likes.png",
      ),
      _StatCard(
        title: "Bookings",
        value: "999,000",
        color: Colors.blue,
        imagePath: "assets/Bookings.png",
      ),
      _StatCard(
        title: "Earnings",
        value: "999,000",
        color: Colors.green,
        icon: Icons.circle, // Flutter icon
      ),
    ],
  );
}


  Widget _ratingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 6),
              Text("4.8",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, size: 16, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Widget _reviewCard() {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFE6D9FF),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Avantika Agarwal",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "2 days ago",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Michael is amazing with pets. He took exceptional care of my two cats while I was away. He took exceptional care of my two cats while I was away.",
                style: TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String? imagePath;
  final IconData? icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    this.imagePath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),

          // Bottom-right icon
          Align(
            alignment: Alignment.bottomRight,
            child: imagePath != null
                ? Image.asset(imagePath!, height: 28)
                : Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
