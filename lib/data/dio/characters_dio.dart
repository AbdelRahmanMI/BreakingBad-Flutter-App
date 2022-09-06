import 'package:breakingbad_project/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersDio {
  late Dio dio;

  CharactersDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 40000,
      receiveTimeout: 30000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
