part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({
    required this.errorText,
    required this.products,
    required this.myState,
    required this.isAdded,
  });

  final String errorText;
  final List<ProductItem> products;
  final MyState myState;
  final bool isAdded;

  ProductState copyWith({List<ProductItem>? products, MyState? myState, String? errorText, bool? isAdded}) =>
      ProductState(
        products: products ?? this.products,
        myState: myState ?? this.myState,
        errorText: errorText ?? this.errorText,
        isAdded: isAdded ?? this.isAdded,
      );

  @override
  List<Object?> get props => [products, myState, isAdded, errorText];
}
