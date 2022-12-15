import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/app.dart';
import 'package:mobii_exam_clean/src/core/dependency_injector/injector.dart';
import 'package:mobii_exam_clean/src/core/logger/simple_bloc_observer.dart';

void main() async {
  // Register all the models and services before the app starts
  configureDependencies(Environment.dev);
  //bloc events logger
  Bloc.observer = SimpleBlocObserver();

  runApp(const App());
}
