import 'package:briktest/core/api/products_api.dart';
import 'package:briktest/core/model/check_response.dart';
import 'package:briktest/core/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/dio.dart';

import '../base_view_model.dart';

class ProductsListViewModel extends BaseViewModel {
  ProductsListViewModel({
    required this.productsApi,
  });

  final ProductsApi productsApi;
  List<ProductItemResponse> productItemsList = <ProductItemResponse>[];

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    await getProductList();
    setBusy(false);
  }

  Future<bool> getProductList() async {
    try {
      final HttpResponse<List<ProductItemResponse>> getProductsList =
      await productsApi.getProductList();

      if (getProductsList.isSuccess) {
        productItemsList = getProductsList.data;
        return true;
      }
      else {
        return false;
      }
    } on Exception catch (e) {
      debugPrint('Error is $e}');
      return false;
    }
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }
}
