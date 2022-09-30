import 'package:assistant_task/cubits/product_cubit.dart';
import 'package:assistant_task/data/models/state/my_state.dart';
import 'package:assistant_task/ui/post_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProducts extends StatefulWidget {
  const GetProducts({Key? key}) : super(key: key);

  @override
  State<GetProducts> createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {

  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Product")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PostProduct(),
            ),
          );
        },
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          var st = state.myState;
          if (st == MyState.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (st == MyState.SUCCESS) {
            return RefreshIndicator(
              onRefresh: () async {},
              child: SizedBox(
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: state.products.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: CupertinoColors.systemGreen,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(state.products[index].id.toString()),
                        ),
                        title: Text(state.products[index].attributeItem.name),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(child: SizedBox(child: Text('no internet')));
          }
        },
      ),
    );
  }
}
