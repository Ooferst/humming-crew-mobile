import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 40.0,
                ),
                const SizedBox(height: 12),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Hafiz Nathan Vesaputra";
  final String npm = "2406432406";
  final String kelas = "PBP F";

  final List<MenuItem> menuItems = [
    MenuItem("All Products", Icons.shopping_cart, Colors.blue),
    MenuItem("My Products", Icons.inventory, Colors.green),
    MenuItem("Create Product", Icons.add_circle, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Humming Crew',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Info Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('NPM', npm, context),
                _buildInfoCard('Name', nama, context),
                _buildInfoCard('Class', kelas, context),
              ],
            ),
            
            const SizedBox(height: 32.0),
            
            // Welcome Text
            const Text(
              'Welcome to Humming Crew!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            
            const SizedBox(height: 8.0),
            
            const Text(
              'Your Ultimate Sport Shop',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            
            const SizedBox(height: 32.0),
            
            // Menu Grid
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 1,
                childAspectRatio: 3.0,
                children: menuItems.map((MenuItem item) {
                  return MenuCard(item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              content,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}