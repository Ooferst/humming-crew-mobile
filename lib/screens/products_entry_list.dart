import 'package:flutter/material.dart';
import 'package:humming_crew/models/products_entry.dart';
import 'package:humming_crew/widgets/left_drawer.dart';
import 'package:humming_crew/screens/products_detail.dart';
import 'package:humming_crew/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsEntryListPage extends StatefulWidget {
  const ProductsEntryListPage({super.key});

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> {
  bool _showMyProductsOnly = false;
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    final endpoint = _showMyProductsOnly ? '/json-my/' : '/json/';
    final response = await request.get('http://localhost:8000$endpoint');

    // Decode response to json format
    var data = response;
    
    // Convert json data to NewsEntry objects
    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Entry List'),
         actions: [
           // ✅ TOGGLE SWITCH UNTUK FILTER
          Row(
            children: [
              Text('My Products Only', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
              Switch(
                value: _showMyProductsOnly,
                onChanged: (value) {
                  setState(() {
                    _showMyProductsOnly = value;
                     });
                },
              ),
            ],
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in humming crew yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductsEntryCard(
                  products: snapshot.data![index],
                  onTap: () {
                    // Navigate to news detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsDetailPage(
                          products: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}