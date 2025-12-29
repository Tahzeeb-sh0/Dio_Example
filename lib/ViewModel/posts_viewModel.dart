
import 'package:flutter/cupertino.dart';

import '../Model/PostsModel.dart';
import '../Repo/posts_repository.dart';

class PostsViewModel extends ChangeNotifier{

  final PostsRepository postsRepository = PostsRepository();

  List<PostsModel>? postsList;
  bool isLoading = false;
  String error = "";

  Future<void> getPosts() async{

    isLoading = true;
    notifyListeners();

    try{
      postsList = await postsRepository.fetcAllPosts();
    }catch(e){
      error = e.toString();

    }

    isLoading = false;
    notifyListeners();

  }

}
