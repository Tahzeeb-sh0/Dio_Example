import 'package:dio/dio.dart';
import 'package:dio_example/Helper/dio_helper.dart';
import 'package:dio_example/Model/CommentModel.dart';
import 'package:dio_example/Model/PostsModel.dart';


class CommentRepository {
  Future<List<CommentModel>> fetchComments() async {

    Response response = await DioHelper.get("comments");
    print(response.data);
    print("Data ");

    if (response.statusCode == 200) {
      List data = response.data;

      return data.map((e) => CommentModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load comments");
    }
  }
}

