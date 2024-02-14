part of 'catalog_bloc.dart';

sealed class ProductEvent {}


class LoadingProduct extends ProductEvent {}


class Searching extends ProductEvent {
  final String query;

  Searching({required this.query});
}