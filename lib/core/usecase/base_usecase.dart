import 'dart:async';

abstract class BaseStreamUseCase<Type, Params>{
  Stream<Type> call (Params params);
}

abstract class BaseCloseUseCase<Type>{
  Future<Type> call ();
}