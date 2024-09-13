import 'package:briktest/features/add-product/add_product_view.dart';
import 'package:briktest/features/product-detail/product_detail_view.dart';
import 'package:briktest/features/products-list/products_list_view.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class Router {
  const Router();

  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.productList:
        return MaterialPageRoute<Object>(
            builder: (_) => const ProductsListView());
      case RoutePaths.productDetail:
        final ProductDetailViewParam arguments =
        settings.arguments is ProductDetailViewParam
            ? settings.arguments! as ProductDetailViewParam
            : ProductDetailViewParam(null);
        return MaterialPageRoute<Object>(
            builder: (_) => ProductDetailView(param: arguments,));
      case RoutePaths.addProduct:
        return MaterialPageRoute<Object>(
          builder: (_) => const AddProductView(),
        );
      default:
        return MaterialPageRoute<Object>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
