import 'package:bot_toast/bot_toast.dart';
import 'package:briktest/core/api/products_api.dart';
import 'package:briktest/features/add-product/add_product_view_model.dart';
import 'package:briktest/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constants.dart';
import '../../ui/text_styles.dart';
import '../../ui/widgets/gap.dart';
import '../base_view.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AddProductViewModel>(
      model: AddProductViewModel(
        productsApi: Provider.of<ProductsApi>(context),
      ),
      onModelReady: (AddProductViewModel model) => model.initModel(),
      onModelDispose: (AddProductViewModel model) => model.disposeModel(),
      builder: (BuildContext context, AddProductViewModel model, _) {
        if (model.isBusy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return AddProductContent(model);
      },
    );
  }
}

class AddProductContent extends StatelessWidget {
  const AddProductContent(this.model, {super.key});

  final AddProductViewModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Add new Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: model.formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Gap.vertical(20),
                CustomTextField(
                  label: 'Category ID',
                  placeholder: 'Insert category ID here...',
                  controller: model.categoryIDController,
                  onChanged: model.onCategoryIDChanged,
                  validator: model.inputValidator,
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Category Name',
                  placeholder: 'Insert category name here...',
                  controller: model.categoryNameController,
                  onChanged: model.onCategoryNameChanged,
                  validator: model.inputValidator,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'SKU',
                  placeholder: 'Insert product SKU here...',
                  controller: model.skuController,
                  onChanged: model.onSkuChanged,
                  validator: model.inputValidator,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Product Name',
                  placeholder: 'Insert product name here...',
                  controller: model.productNameController,
                  validator: model.inputValidator,
                  onChanged: model.onProductNameChanged,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Product Description',
                  placeholder: 'Insert product description here...',
                  controller: model.productDescriptionController,
                  onChanged: model.onProductDescriptionChanged,
                  validator: model.inputValidator,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Product Weight',
                  placeholder: 'Insert product weight here...',
                  controller: model.productWeightController,
                  onChanged: model.onProductWeightChanged,
                  validator: model.inputValidator,
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Product Width',
                  placeholder: 'Insert product width here...',
                  controller: model.productWidthController,
                  onChanged: model.onProductWidthChanged,
                  validator: model.inputValidator,
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Product Length',
                  placeholder: 'Insert product length here...',
                  controller: model.productLengthController,
                  onChanged: model.onProductLengthChanged,
                  validator: model.inputValidator,
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Product Height',
                  placeholder: 'Insert product height here...',
                  controller: model.productHeightController,
                  onChanged: model.onProductHeightChanged,
                  validator: model.inputValidator,
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Image URL',
                  placeholder: 'Insert image URL here...',
                  controller: model.imageURLController,
                  onChanged: model.onImageURLChanged,
                  validator: model.inputValidator,
                  isRequired: true,
                ),
                CustomTextField(
                  label: 'Price',
                  placeholder: 'Insert product price here...',
                  controller: model.priceController,
                  onChanged: model.onPriceChanged,
                  validator: model.inputValidator,
                  keyboardType: TextInputType.number,
                  isRequired: true,
                ),
                const Gap.vertical(10),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurpleAccent),
                      ),
                      onPressed: () async {
                        final bool isSuccess = await model.submitProduct();
                        if (isSuccess) {
                          if (context.mounted) {
                            Navigator.of(context)
                                .pushNamed(RoutePaths.productList);
                          }
                        } else {
                          BotToast.showText(
                            text: 'Failed to Create',
                            duration: const Duration(seconds: 3),
                          );
                        }
                      },
                      child: Text(
                        'Save Product',
                        style: buildTextStyle(
                          fontSize: 14,
                          fontColor: Colors.white,
                        ),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
