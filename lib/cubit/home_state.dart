
import 'package:equatable/equatable.dart';

import '../models/post_model.dart';

abstract class HomeState extends Equatable{}

class HomeInitialState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState{
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class HomeLoadPostState extends HomeState{
  final List<PostModel> posts;

  HomeLoadPostState(this.posts);

  @override
  List<Object?> get props => [posts];

}