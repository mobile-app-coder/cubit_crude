import 'package:cubit_crude/cubit/home_cubit.dart';
import 'package:cubit_crude/views/viewOfError.dart';
import 'package:cubit_crude/views/viewOfLoading.dart';
import 'package:cubit_crude/views/viewOfPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_state.dart';
import 'create_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<HomeCubit>(context);
    cubit.onLoadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const CreatePostPage();
            }));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Post crud"),
          elevation: 10,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext ctx, HomeState state) {
            if (state is HomeErrorState) {
              return viewOfError("Error state");
            }
            if (state is HomeLoadPostState) {
              return viewOfPosts(state.posts);
            }
            return viewOfLoading();
          },
        ));
  }
}
