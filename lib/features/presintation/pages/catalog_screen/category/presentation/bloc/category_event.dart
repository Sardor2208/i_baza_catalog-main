part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}


class LoadingCategory extends CategoryEvent {}


class Searching extends CategoryEvent {
  final String query;

  Searching({required this.query});
}

