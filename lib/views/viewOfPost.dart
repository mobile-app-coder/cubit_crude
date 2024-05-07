import 'package:cubit_crude/views/post_item_view.dart';
import 'package:flutter/cupertino.dart';

import '../models/post_model.dart';

Widget viewOfPosts(List<PostModel> posts) {
  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      return slidableItemOfPost(posts[index]);
    },
  );
}
