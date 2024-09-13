import 'package:briktest/core/api/products_api.dart';
import 'package:briktest/core/model/check_response.dart';
import 'package:briktest/core/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/dio.dart';

import '../base_view_model.dart';

class AddProductViewModel extends BaseViewModel {
  AddProductViewModel({
    required this.productsApi
  });

  final ProductsApi productsApi;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String categoryID = '';
  String categoryName = '';
  String sku = '';
  String productName = '';
  String productDescription = '';
  String productWeight = '';
  String productWidth = '';
  String productLength = '';
  String productHeight = '';
  String imageURL = '';
  String price = '';

  final TextEditingController categoryIDController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productWeightController = TextEditingController();
  final TextEditingController productWidthController = TextEditingController();
  final TextEditingController productLengthController = TextEditingController();
  final TextEditingController productHeightController = TextEditingController();
  final TextEditingController imageURLController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }

  String? inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Input cannot be empty';
    }

    return null;
  }

  void onCategoryIDChanged(String value) {
    categoryID = value;
    notifyListeners();
  }

  void onCategoryNameChanged(String value) {
    categoryName = value;
    notifyListeners();
  }

  void onSkuChanged(String value) {
    sku = value;
    notifyListeners();
  }

  void onProductNameChanged(String value) {
    productName = value;
    notifyListeners();
  }

  void onProductDescriptionChanged(String value) {
    productDescription = value;
    notifyListeners();
  }

  void onProductWeightChanged(String value) {
    productWeight = value;
    notifyListeners();
  }

  void onProductWidthChanged(String value) {
    productWidth = value;
    notifyListeners();
  }

  void onProductLengthChanged(String value) {
    productLength = value;
    notifyListeners();
  }

  void onProductHeightChanged(String value) {
    productHeight = value;
    notifyListeners();
  }

  void onImageURLChanged(String value) {
    imageURL = value;
    notifyListeners();
  }

  void onPriceChanged(String value) {
    price = value;
    notifyListeners();
  }

  Future<bool> submitProduct() async {
    try {
      final product = ProductItemRequest(
          categoryId: categoryID,
          categoryName: categoryName,
          sku: sku,
          name: productName,
          description: productDescription,
          weight: productWeight,
          width: productWidth,
          length: productLength,
          height: productHeight,
          image: imageURL,
          price: price
      );

      final HttpResponse<ProductItemResponse> createProductResult =
          await productsApi.createNewProduct(
            product: product
          );
      return true;
    } on Exception catch (e) {
      debugPrint('Error is $e}');
      return false;
    }
  }
}
