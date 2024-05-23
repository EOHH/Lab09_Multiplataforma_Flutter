import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product; // Declara una variable para almacenar el producto

  // Constructor que recibe el producto como argumento
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProductImage(product['image']), // Utiliza la ruta de la imagen del producto
            SizedBox(height: 20),
            Text(
              product['name'], // Utiliza el nombre del producto
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Precio: ${product['price']}', // Utiliza el precio del producto
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              product['description'], // Utiliza la descripción del producto
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String? imagePath) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: imagePath != null ? Image.asset(imagePath, fit: BoxFit.cover) : Container(), // Muestra la imagen del producto desde la ruta local
      ),
    );
  }
}
