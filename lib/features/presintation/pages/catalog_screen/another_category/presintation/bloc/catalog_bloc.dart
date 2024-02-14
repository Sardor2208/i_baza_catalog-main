import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:i_baza_catalog/features/presintation/pages/catalog_screen/another_category/data/katalog_model/model.dart';
import 'package:meta/meta.dart';
import '../../../category/data/model/status.dart';
import '../../data/repository/repository.dart';
import 'package:flutter/foundation.dart';
part 'catalog_state.dart';
part 'catalog_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _response;
  ProductBloc({required ProductRepository response})
      : _response = response,
        super(ProductState(
        searchProduct: [],
        isSearching: false,
        status: LoadingStatus.pure,
        productList: [],)) {
    on<LoadingProduct>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        List<ProductModel> ls = await _response.getCategory();

        emit(
          state.copyWith(
            categoryList: ls,
            status: LoadingStatus.loadedWithSuccess,
          ),
        );
      } catch (e) {
        addError(e);
        print(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });


    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.productList
            .where((element) => element.name.contains(event.query))
            .toList();
        emit(state.copyWith(searchedCategory: newList, isSearching: true));
      }
    });
  }
}
