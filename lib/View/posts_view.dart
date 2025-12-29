import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/posts_viewModel.dart';

class ViewModel extends StatefulWidget {
  const ViewModel({Key? key}) : super(key: key);

  @override
  State<ViewModel> createState() => PostViewModelState();
}

class PostViewModelState extends State<ViewModel> {

  @override
  void initState() {
    super.initState();

    // ✅ SAFE WAY to access Provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsViewModel>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar.new(title: const Text("Posts"),),
      body: Consumer<PostsViewModel>(
          builder: (context,postViewModel, child){

            if(postViewModel.isLoading){
              return const Center(child: CircularProgressIndicator(),);
            }

            return ListView.builder(
                itemCount: postViewModel.postsList?.length,
                itemBuilder: (context,index){
                  var posts = postViewModel.postsList?[index];
                  return ListTile(
                    title: Text(posts!.body.toString()),
                    
                  );
                });

          }
      ),
    );
  }
}

