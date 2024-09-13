import 'package:flutter/material.dart';

import '../../../ui/text_styles.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.onClick,
  });

  final String name;
  final String description;
  final String image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFEAECF0)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: <Widget>[
            _buildProductImage(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: buildTextStyle(
                      fontSize: 12,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    description,
                    style: buildTextStyle(
                      fontSize: 12,
                      fontColor: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    if (image.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          image,
          width: 24,
          height: 24,
        ),
      );
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: const Color(0xFFD70101),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 18),
    );
  }
}
