import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change.toString());
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print(bloc.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print(bloc.toString());
  }
}