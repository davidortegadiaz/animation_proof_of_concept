import 'package:flutter_bloc/flutter_bloc.dart';

class AnimationCubit extends Cubit<int> {
  AnimationCubit() : super(0);

  void changeAnimation() {
    if (state >= 6) {
      emit(0);
      return;
    }

    emit(state + 1);
  }
}
