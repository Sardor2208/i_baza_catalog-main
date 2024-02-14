part of 'category_bloc.dart';


class CategoryState {
  final LoadingStatus status;
  final List<CategoryModel> categoryList;
  final List<CategoryModel> searchedCategory;
  final bool isSearching;
  CategoryState({
    required this.status,
    required this.categoryList,
    required this.searchedCategory,
    required this.isSearching,
  });


  CategoryState copyWith({
    LoadingStatus? status,
    List<CategoryModel>? categoryList,
    List<CategoryModel>? searchedCategory,
    bool? isSearching,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categoryList: categoryList ?? this.categoryList,
      searchedCategory: searchedCategory ?? this.searchedCategory,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() {
    return 'CategoryState(status: $status, categoryList: $categoryList, isSearching: $isSearching,searchedCategory: $searchedCategory)';
  }

  @override
  bool operator ==(covariant CategoryState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          listEquals(other.categoryList, categoryList) &&
          listEquals(other.searchedCategory, searchedCategory) &&
          other.isSearching == isSearching;
  }

  @override
  int get hashCode {
    return status.hashCode ^
    categoryList.hashCode ^
    searchedCategory.hashCode ^
    isSearching.hashCode;
  }
}



