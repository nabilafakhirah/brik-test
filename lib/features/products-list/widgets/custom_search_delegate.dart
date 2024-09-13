import 'package:briktest/core/model/product.dart';
import 'package:briktest/features/products-list/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../product-detail/product_detail_view.dart';

class CustomSearchDelegate extends SearchDelegate {

  CustomSearchDelegate({required this.products});

  final List<ProductItemResponse> products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductItemResponse> matchQuery = [];
    for (var product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ProductItemView(
            name: result.name,
            description: result.description,
            image: result.image,
            onClick: () {
              Navigator.of(context).pushNamed(RoutePaths.productDetail,
                  arguments: ProductDetailViewParam(result));
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductItemResponse> matchQuery = [];
    for (var product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ProductItemView(
            name: result.name,
            description: result.description,
            image: result.image,
            onClick: () {
              Navigator.of(context).pushNamed(RoutePaths.productDetail,
                  arguments: ProductDetailViewParam(result));
            },
          ),
        );
      },
    );
  }
}