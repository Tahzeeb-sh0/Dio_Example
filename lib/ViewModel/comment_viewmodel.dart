
import 'package:dio_example/Model/CommentModel.dart';
import 'package:dio_example/Repo/comment_repository.dart';
import 'package:flutter/cupertino.dart';

class CommentViewModel extends ChangeNotifier {
  final CommentRepository _repository = CommentRepository();

  List<CommentModel> comments = [];
  bool isLoading = false;
  String error = "";

  Future<void> getComments() async {
    isLoading = true;
    notifyListeners();

    try {
      comments = await _repository.fetchComments();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
