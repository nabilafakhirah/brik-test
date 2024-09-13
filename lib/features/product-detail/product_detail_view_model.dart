import 'package:briktest/features/product-detail/product_detail_view.dart';

import '../base_view_model.dart';

class ProductDetailViewModel extends BaseViewModel {
  ProductDetailViewModel({
    required this.param
  });

  final ProductDetailViewParam param;

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
}
