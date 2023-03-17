import 'package:bloc/bloc.dart';
import 'package:web_provise/core/logging/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printOut('onEvent => event: ${'${event.runtimeType}'.toUpperCase()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    printOut('onError => error: ${'${bloc.runtimeType}'.toUpperCase()}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printOut('onChange => Change: ${'${bloc.runtimeType}'.toUpperCase()}');
  }
}
