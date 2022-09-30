import 'package:assistant_task/data/models/product_item.dart';
import 'package:assistant_task/data/services/api_provider.dart';

class ProductsRepo {
  ProductsRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<ProductItem>> getAllProducts() => apiProvider.getData();
  Future<bool> addProduct({required String productName, required int productId}) => apiProvider.addData(name: productName, id: productId);
}