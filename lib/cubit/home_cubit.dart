import 'package:bloc/bloc.dart';
import 'package:cubit_crude/cubit/home_state.dart';
import 'package:cubit_crude/services/dio_service.dart';
import 'package:cubit_crude/services/log_setvice.dart';

import '../models/post_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<PostModel> list = [];

  Future onLoadPosts() async {
    emit(HomeLoadingState());

    var result = await NetworkService.GET(NetworkService.API_LIST, {});
    if (result != null) {
      LogService.i(result[0].title);
      list.addAll(result);
      emit(HomeLoadPostState(list));
    } else {
      emit(HomeErrorState("Error in the server"));
    }
  }

}
