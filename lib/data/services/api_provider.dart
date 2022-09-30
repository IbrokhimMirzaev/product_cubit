import 'dart:io';

import 'package:assistant_task/data/models/product_item.dart';
import 'package:assistant_task/data/services/api_client.dart';
import 'package:assistant_task/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  ApiProvider({required this.apiClient});

  final ApiClient apiClient;

  Future<List<ProductItem>> getData() async {
    try {
      Response res = await apiClient.dio.get(BASE_URL);
      if (res.statusCode == HttpStatus.ok) {
        List<ProductItem> products = (res.data["data"] as List?)?.map((e) => ProductItem.fromJson(e)).toList() ?? [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> addData({required String name, required int id}) async {
    try {
      Response res = await apiClient.dio.post(BASE_URL, data: {"data": {"name": name, "product_id": id}});

      if (res.statusCode == HttpStatus.ok) {
        bool isAdded = res.data["data"]["attributes"]["product_id"] == id;
        return isAdded;
      }
      else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}