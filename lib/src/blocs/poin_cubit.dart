import 'package:flutter_bloc/flutter_bloc.dart';

class PoinCubit extends Cubit<int> {
  PoinCubit() : super(0);

  void increment() {
    print('Menambahkan Poin');
    Future.delayed(Duration(seconds: 2), () {
      emit(state + 100);
    });
  }

  @override
  void onChange(Change<int> change) {
    print('Current State : ${change.currentState}');
    print('Next State : ${change.nextState}');
    super.onChange(change);
  }
}
