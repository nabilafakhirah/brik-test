import 'package:retrofit/dio.dart';

extension CheckResponse<T> on HttpResponse<T> {
  bool get isSuccess {
    return response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202;
  }

  bool get isPostSuccess {
    if (!isSuccess) {
      return false;
    }

    if (response.data is Map<String, dynamic>) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      return data['message'] == 'Success';
    }

    return false;
  }
}