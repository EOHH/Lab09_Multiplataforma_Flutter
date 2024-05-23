import 'package:flutter/material.dart';
import 'product_details.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista con Imágenes y Fuentes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'category': 'Alimentos',
      'name': 'Manzana',
      'image': 'assets/images/manzana.png',
      'price': '\$1.99',
      'description': 'Una deliciosa manzana roja.',
    },
    {
      'category': 'Animales',
      'name': 'Perro',
      'image': 'assets/images/perro.jpg',
      'price': '\$299',
      'description': 'Un lindo perro juguetón.',
    },
    {
      'category': 'Lugares',
      'name': 'París',
      'image': 'assets/images/paris.png',
      'price': '\$999',
      'description': 'La hermosa ciudad de París.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista con Imágenes y Fuentes'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(product: item),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    leading: AspectRatio(
                      aspectRatio: 1,
                      child: _buildImage(item['image']),
                    ),
                    title: Center(
                      child: Text(
                        item['name'],
                        style: _getTextStyle(item['category']),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? imageUrl) {
    if (imageUrl != null && imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        imageUrl!,
        fit: BoxFit.cover,
      );
    }
  }

  TextStyle _getTextStyle(String? category) {
    switch (category) {
      case 'Alimentos':
        return TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
      case 'Animales':
        return TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue);
      case 'Lugares':
        return TextStyle(fontFamily: 'Ubuntu', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green);
      default:
        return TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    }
  }
}
