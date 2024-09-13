import 'package:briktest/core/model/product.dart';
import 'package:briktest/features/product-detail/product_detail_view_model.dart';
import 'package:briktest/ui/text_styles.dart';
import 'package:flutter/material.dart';

import '../../ui/widgets/gap.dart';
import '../base_view.dart';

class ProductDetailViewParam {
  ProductDetailViewParam(this.productItem);

  final ProductItemResponse? productItem;
}

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.param});

  final ProductDetailViewParam param;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      model: ProductDetailViewModel(param: param),
      onModelReady: (ProductDetailViewModel model) => model.initModel(),
      onModelDispose: (ProductDetailViewModel model) => model.disposeModel(),
      builder: (BuildContext context, ProductDetailViewModel model, _) {
        if (model.isBusy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ProductDetailContent(model);
      },
    );
  }
}

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent(this.model, {super.key});

  final ProductDetailViewModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('${model.param.productItem?.name} Detail'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: ListView(
            children: [
              // Product image
              Image.network(
                model.param.productItem?.image ?? '',
                height: MediaQuery.of(context).size.height / 1.8,
                fit: BoxFit.fill,
              ),

              // Product title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Text(model.param.productItem?.name ?? '',
                    style: buildTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontColor: Colors.black)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Text(
                  model.param.productItem?.description ?? '',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0),
                child: Text(
                    'Category: ${model.param.productItem?.categoryName}',
                    style: buildTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.black)),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0),
                child: Text(
                    'Weight: ${model.param.productItem?.weight} gr',
                    style: buildTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                    'Dimensions: ${model.param.productItem?.length} x ${model.param.productItem?.width} x ${model.param.productItem?.height}',
                    style: buildTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Rp. ${model.param.productItem?.price}',
                    style: buildTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.black)),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ));
  }
}
