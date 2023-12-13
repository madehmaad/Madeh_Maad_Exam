import 'package:dio/dio.dart';

getData(String search) async {
  Dio dio = Dio();

  Response response =
      await dio.get('https://dummyjson.com/products/search?q=${search}');
  if (response.statusCode == 200) {
    return response.data['products'];
  } else {
    return 'Error';
  }
}
