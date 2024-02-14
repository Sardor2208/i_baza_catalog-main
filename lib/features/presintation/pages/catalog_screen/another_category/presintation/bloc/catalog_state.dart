part of 'catalog_bloc.dart';


class ProductState {
  final LoadingStatus status;
  final List<ProductModel> productList;
  final List<ProductModel> searchProduct;
  final bool isSearching;
  ProductState({
    required this.status,
    required this.productList,
    required this.searchProduct,
    required this.isSearching,
  });


  ProductState copyWith({
    LoadingStatus? status,
    List<ProductModel>? categoryList,
    List<ProductModel>? searchedCategory,
    bool? isSearching,
  }) {
    return ProductState(
      status: status ?? this.status,
      productList: categoryList ?? this.productList,
      searchProduct: searchedCategory ?? this.searchProduct,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() {
    return 'ProductState(status: $status, categoryList: $productList, isSearching: $isSearching,searchedCategory: $searchProduct)';
  }

  @override
  bool operator ==(covariant ProductState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          listEquals(other.productList, productList) &&
          listEquals(other.searchProduct, searchProduct) &&
          other.isSearching == isSearching;
  }

  @override
  int get hashCode {
    return status.hashCode ^
    productList.hashCode ^
    searchProduct.hashCode ^
    isSearching.hashCode;
  }
}