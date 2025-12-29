import 'package:dio/dio.dart';
import '../Helper/dio_helper.dart';
import '../Model/PostsModel.dart';

class PostsRepository {


  Future<List<PostsModel>> fetcAllPosts() async{
    Response response = await DioHelper.get("posts");

    if(response.statusCode == 200){
      List data = response.data;
      return data.map((e)=> PostsModel.fromJson(e)).toList();
    }else{
      throw Exception("Failed to load comments");
    }
  }
}
