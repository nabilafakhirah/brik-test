import 'package:briktest/core/model/product.dart';
import 'package:briktest/features/product-detail/product_detail_view.dart';
import 'package:briktest/features/products-list/products_list_view_model.dart';
import 'package:briktest/features/products-list/widgets/custom_search_delegate.dart';
import 'package:briktest/features/products-list/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/api/products_api.dart';
import '../../core/constants/app_constants.dart';
import '../base_view.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductsListViewModel>(
      model: ProductsListViewModel(
        productsApi: Provider.of<ProductsApi>(context),
      ),
      onModelReady: (ProductsListViewModel model) => model.initModel(),
      onModelDispose: (ProductsListViewModel model) => model.disposeModel(),
      builder: (BuildContext context, ProductsListViewModel model, _) {
        if (model.isBusy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ProductsListContent(model);
      },
    );
  }
}

class ProductsListContent extends StatelessWidget {
  const ProductsListContent(this.model, {super.key});

  final ProductsListViewModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate(
                    products: model.productItemsList
                  )
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Product List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: _buildProductsList(context, model),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RoutePaths.addProduct);
          },
          backgroundColor: Colors.deepPurpleAccent,
          child: const Icon(Icons.add, color: Colors.white, size: 28)),
    );
  }

  Widget _buildProductsList(
    BuildContext context,
    ProductsListViewModel model,
  ) {
    if (model.isBusy) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: model.productItemsList.length,
        itemBuilder: (BuildContext context, int index) {
          final ProductItemResponse productItem = model.productItemsList[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProductItemView(
              name: productItem.name,
              description: productItem.description,
              image: productItem.image,
              onClick: () {
                Navigator.of(context).pushNamed(RoutePaths.productDetail,
                    arguments: ProductDetailViewParam(productItem));
              },
            ),
          );
        },
      ),
    );
  }
}
