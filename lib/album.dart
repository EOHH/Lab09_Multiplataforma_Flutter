import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Imágenes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galería de Imágenes'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ImageWidget(imagePath: 'assets/images/alianza1.png', textStyle: TextStyle(fontFamily: 'Arial')),
          ImageWidget(imagePath: 'assets/images/alianza.jpg', textStyle: TextStyle(fontFamily: 'Times New Roman')),
          ImageWidget(imagePath: 'assets/images/alianza2.svg', textStyle: TextStyle(fontFamily: 'Roboto')),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final TextStyle textStyle;

  const ImageWidget({required this.imagePath, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: _buildImage(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _getImageName(),
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(imagePath, fit: BoxFit.cover);
    } else {
      return Image.asset(imagePath, fit: BoxFit.cover);
    }
  }

  String _getImageName() {
    return imagePath.split('/').last.replaceAll('.png', '').replaceAll('.jpg', '').replaceAll('.svg', '');
  }
}
