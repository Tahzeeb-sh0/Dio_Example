import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/comment_view.dart';
import 'ViewModel/comment_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CommentViewModel>(
          create: (_) => CommentViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CommentView(),
      ),
    );
  }
}
