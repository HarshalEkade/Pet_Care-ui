import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'tabs/pawprints_tab.dart';
import 'tabs/services_tab.dart';
import 'tabs/customers_tab.dart';

class SitterScreen extends StatefulWidget {
  const SitterScreen({super.key});

  @override
  State<SitterScreen> createState() => _SitterScreenState();
}

class _SitterScreenState extends State<SitterScreen> {
  int selectedTab = 0;
  int bottomIndex = 1;

  final tabs = const [
    PawprintsTab(),
    ServicesTab(),
    CustomersTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            _header(selectedTab),
            _topTabs(),

            if (selectedTab == 0) ...[
              _filterRow(),
              const SizedBox(height: 16),
            ],

            if (selectedTab == 2) ...[
              _searchBar(),
              const SizedBox(height: 16),
            ],

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: tabs[selectedTab],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _header(int selectedTab) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            selectedTab == 0 ? "Pet Sitter" : "Sitter",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.yellow,
              child: Icon(Icons.add, size: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topTabs() {
    final titles = ["PawPrints", "Services", "Customers"];

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(3, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTab = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selectedTab == index
                      ? AppColors.yellow
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: selectedTab == index
                        ? Colors.black
                        : const Color.fromRGBO(181, 181, 181, 1),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _filterRow() {
    final items = ["This Week", "This Month", "This Year", "All Time"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((e) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                e,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 18, color: AppColors.textGrey),
                  SizedBox(width: 6),
                  Text(
                    "Search..",
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.yellow,
            child: const Icon(Icons.tune, size: 18, color: Colors.black),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.favorite_border,
              size: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: bottomIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      onTap: (i) => setState(() => bottomIndex = i),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Sitter"),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: "Agenda"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), label: "Earning"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
      ],
    );
  }
}
