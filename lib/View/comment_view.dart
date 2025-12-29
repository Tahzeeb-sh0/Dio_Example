import 'package:dio_example/Model/PostsModel.dart';
import 'package:dio_example/ViewModel/posts_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../ViewModel/comment_viewmodel.dart';

class CommentView extends StatefulWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {

  @override
  void initState() {
    super.initState();

    // ✅ SAFE WAY to access Provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommentViewModel>().getComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comments")),
      body: Consumer<CommentViewModel>(
        builder: (context, vm, child) {

          if (vm.isLoading) {
            return const Center(child: Shimmer(gradient:LinearGradient(colors: [Colors.red,Colors.blue]) , child:SizedBox(height: 200,width: 200,)));
          }

          if (vm.error.isNotEmpty) {
            return Center(child: Text(vm.error));
          }

          return ListView.builder(
            itemCount: vm.comments.length,
            itemBuilder: (context, index) {
              final comment = vm.comments[index];

              return ListTile(
                title: Text(comment.name ?? "hello" ,style: TextStyle(color: Colors.blue),),
                subtitle: Text(comment.email ?? "he"),
              );
            },
          );
        },
      ),
    );
  }
}

