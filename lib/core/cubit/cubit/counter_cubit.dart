import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<Map<int, int>> {
  CounterCubit() : super({});

  void add(int index) {
    final newMap = Map<int, int>.from(state);
    newMap[index] = (newMap[index] ?? 0) + 1;
    emit(newMap);
  }

  void reset() {
    emit({});
  }
}
