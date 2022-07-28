part of 'test_cubit.dart';

abstract class TestState extends Equatable {
  const TestState();
  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestSuccess extends TestState {}

class TestError extends TestState {}
