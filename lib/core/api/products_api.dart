import 'package:briktest/core/model/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'products_api.g.dart';

@RestApi()
abstract class ProductsApi {
  factory ProductsApi(Dio dio, {String baseUrl}) = _ProductsApi;

  @GET('/products')
  Future<HttpResponse<List<ProductItemResponse>>> getProductList();

  @POST('/products')
  Future<HttpResponse<ProductItemResponse>> createNewProduct({
    @Body() required ProductItemRequest product,
  });
}
