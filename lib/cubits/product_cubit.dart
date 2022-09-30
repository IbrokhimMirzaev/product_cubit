import 'package:assistant_task/data/models/product_item.dart';
import 'package:assistant_task/data/models/state/my_state.dart';
import 'package:assistant_task/data/repos/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productsRepo}) : super(const ProductState(errorText: "", products: [], myState: MyState.PURE, isAdded: false));

  final ProductsRepo productsRepo;

  void getProducts() async {
    emit(state.copyWith(myState: MyState.LOADING));
    try {
      var products = await productsRepo.getAllProducts();
      emit(state.copyWith(myState: MyState.SUCCESS, products: products));
    } catch (error) {
      emit(state.copyWith(myState: MyState.ERROR, errorText: error.toString()));
    }
  }

  void addProduct({required String productName, required int productId}) async {
    emit(state.copyWith(myState: MyState.LOADING));
    try {
      bool isAdded = await productsRepo.addProduct(productName: productName, productId: productId);
      var products = await productsRepo.getAllProducts();
      emit(state.copyWith(myState: MyState.SUCCESS, products: products, isAdded: isAdded));
    } catch (error) {
      emit(state.copyWith(myState: MyState.ERROR, errorText: error.toString()));
    }
  }
}
