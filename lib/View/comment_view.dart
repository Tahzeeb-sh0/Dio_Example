import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
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
            return const Center(child:SpinKitWaveSpinner(
              color: Colors.blue,
              size: 50.0,
            ));
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
